using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.PostProcessing;
using UnityEngine.UI;

public class SetParticleSpeed : MonoBehaviour
{
    public EventDefine eventDefine;
    public float Blue_Max_EmitSpeed;
    public float Yellow_Max_EmitSpeed;

    public ParticleSystem Yellow_particleSystem;
    public ParticleSystem Blue_particleSystem;

    public TillingUV tillingUV;
  
  
     private float moveSpeed = 0f;

    public float _MoveSpeed {
        get { return moveSpeed; }

        set
        {
            moveSpeed = value;
            setSpeed(moveSpeed);
            SetEmitting(moveSpeed);
            SetLenDisortion(moveSpeed);
            EventCenter.Broadcast<float>(EventDefine.SetSpeed, value);
        }
    }
    // Start is called before the first frame update

    public PostProcessVolume L_postProcessVolume;

    public FinishedUI finishedUI;

    public void Awake() {

        switch (eventDefine)
        {
            case EventDefine.LeftFinished:
                EventCenter.AddListener(EventDefine.LeftFinished, ShowFinishScene);
                break;
            case EventDefine.RightFinished:
                EventCenter.AddListener(EventDefine.RightFinished, ShowFinishScene);
                break;
            default:
                break;
        }
    }

    void Start() {
    

    }


    public void SetMoveSpeed(float val) {
        _MoveSpeed = val;
    }

    private void ShowFinishScene() {
        finishedUI.show();
        StartCoroutine(Reset());
    }

    private IEnumerator Reset() {
        yield return new WaitForSeconds(15f);
        finishedUI.Hide();
        EventCenter.Broadcast(EventDefine.StartListenLoop);
    
    }
    // Update is called once per frame
    void Update()
    {

        //SetPlaneRollingSpeed(moveSpeed);
    }

    public void setSpeed(float speed) {

       float mapppingSpeed = UtilityFun.Mapping(speed, ValueSheet.MinInputSpeed, ValueSheet.MaxInputSpeed, 10f, 20F);

       float blueSpeed = Mathf.Clamp(mapppingSpeed, 5f, 20f);
        float yellowSpeed = blueSpeed + 2;
        Yellow_particleSystem.startSpeed = yellowSpeed;
        Blue_particleSystem.startSpeed = blueSpeed;
    }

    public void SetEmitting(float speed) {
        float mapppingBlueEmitSpeed= UtilityFun.Mapping(speed, ValueSheet.MinInputSpeed, ValueSheet.MaxInputSpeed, 5F, Blue_Max_EmitSpeed);
        float mapppingYellowEmitSpeed = UtilityFun.Mapping(speed, 0F, 20F, 5F, Blue_Max_EmitSpeed);

        ParticleSystem.EmissionModule Y_emission = Yellow_particleSystem.emission;
        Y_emission.rateOverTime = mapppingYellowEmitSpeed;

        ParticleSystem.EmissionModule B_emission = Blue_particleSystem.emission;
        B_emission.rateOverTime = mapppingBlueEmitSpeed;
    }

    public void SetLenDisortion(float speed) {
        LensDistortion lensDistorion = L_postProcessVolume.profile.GetSetting<LensDistortion>();

        float Distorion = UtilityFun.Mapping(speed, ValueSheet.MinInputSpeed, ValueSheet.MaxInputSpeed, 0, -40f);
        lensDistorion.intensity.value = Distorion;
    }

    public void SetPlaneRollingSpeed(float speed) {

        float tillingSpeed = UtilityFun.Mapping(speed, ValueSheet.MinInputSpeed, ValueSheet.MaxInputSpeed, 0.2f, 1f);

        tillingUV.speed = tillingSpeed;
    }
}
