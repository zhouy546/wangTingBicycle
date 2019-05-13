using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DangJianUI : MonoBehaviour
{
    public SetParticleSpeed particleSpeed;
    // Start is called before the first frame update
    private Animator animator;

    public List<DangJianNode> dangJianNodes = new List<DangJianNode>();
    void Start()
    {
        animator = this.GetComponent<Animator>();
        dangJianNodes[dangJianNodes.Count - 1].IsLast = true;
        EventCenter.AddListener(EventDefine.StartListenLoop, BeginListeningSpeedToPlayAnim);
        EventCenter.AddListener<float>(EventDefine.SetSpeed, SetSpeed);

        EventCenter.Broadcast(EventDefine.StartListenLoop);

       
    }

    // Update is called once per frame
    void Update()
    {
       
    }


    public void SetSpeed(float speed) {
        animator.speed = UtilityFun.Mapping(speed, ValueSheet.MinInputSpeed, ValueSheet.MaxInputSpeed, 0, 2);
    }

    public void BeginListeningSpeedToPlayAnim()
    {
        animator.SetTrigger("Play");
        particleSpeed._MoveSpeed = 0;
    }

    public void TriggerAnim(int id) {
        dangJianNodes[id].Play();
    }
}
