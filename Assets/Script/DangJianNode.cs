using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DangJianNode : MonoBehaviour
{
    public SetParticleSpeed particleSpeed;
    public bool IsPlay;
    private Animator animator;
    public bool IsLast;

    public Image image;
    public Text text;

    void Awake() {
        animator = this.GetComponent<Animator>();

        EventCenter.AddListener<float>(EventDefine.SetSpeed, SetSpeed);

    }

    // Start is called before the first frame update
    void Start()
    {
       // Debug.Log(image.sprite.name);
        text.text = image.sprite.name;
    }

    // Update is called once per frame
    void Update()
    {
    }

    public void SetSpeed(float speed) {

        if (IsPlay)
        {
            SetAnimationPlaySpeed(speed);
        }
    }

    private void SetAnimationPlaySpeed(float speed) {
        float mySpeed = UtilityFun.Mapping(speed, ValueSheet.MinInputSpeed, ValueSheet.MaxInputSpeed,0,2);
        animator.speed = mySpeed;
    }

    public void Play() {
        IsPlay = true;
        animator.SetTrigger("Play");
        //Debug.Log("Play");
    }

    public void end() {
        IsPlay = false;
        //Debug.Log("run");

        if (IsLast) {
            switch (particleSpeed.eventDefine)
            {
                case EventDefine.LeftFinished:
                    EventCenter.Broadcast(EventDefine.LeftFinished);
                    break;
                case EventDefine.RightFinished:
                    EventCenter.Broadcast(EventDefine.RightFinished);
                    break;
                default:    
                    break;
            }
        }
    }
}
