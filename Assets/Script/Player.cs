using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Player : MonoBehaviour
{
    public Animator animator;
    private float MinZ=-78.7f,MaxZ=-77.7f;
    public float currentSpeed;
  
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void SetSpeed(float val)
    {
        float M_value = Mathf.Clamp(val, ValueSheet.MinInputSpeed, ValueSheet.MaxInputSpeed);

        animator.speed = UtilityFun.Mapping(M_value, ValueSheet.MinInputSpeed, ValueSheet.MaxInputSpeed, 0.5f, 1.5f);
        this.transform.position                 = new Vector3( this.transform.position.x, this.transform.position.y, UtilityFun.Mapping(M_value, ValueSheet.MinInputSpeed, ValueSheet.MaxInputSpeed, MinZ, MaxZ));
        currentSpeed = M_value;

        EventCenter.Broadcast(EventDefine.SetBGspeed);
    }

    public void SetSpeed(Slider slider)
    {
        animator.speed = UtilityFun.Mapping(slider.value, slider.minValue, slider.maxValue, 0.5f, 1.5f);
        this.transform.position = new Vector3(this.transform.position.x, this.transform.position.y, UtilityFun.Mapping(slider.value, slider.minValue, slider.maxValue, MinZ, MaxZ));
        currentSpeed = slider.value;

        EventCenter.Broadcast(EventDefine.SetBGspeed);
    }
}
