using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Arrow : MonoBehaviour
{
    public float speed;
    private Animator animator;
    public float DelayTime;
    public MeshRenderer meshRenderer;
    // Start is called before the first frame update
    void Start()
    {
        animator = this.GetComponent<Animator>();

        EventCenter.AddListener<float>(EventDefine.SetSpeed, setSpeed);

        StartCoroutine(Play(DelayTime));

        
    }

    // Update is called once per frame
    void Update()
    {
        //float z = transform.localPosition.z;
        //z =z- Time.fixedDeltaTime * speed;
        //Vector3 pos = new Vector3(transform.localPosition.x, transform.localPosition.y, z);
        //this.transform.localPosition = pos;
    }

    public void setSpeed(float _speed) {
      
        speed = UtilityFun.Mapping(_speed, ValueSheet.MinInputSpeed, ValueSheet.MaxInputSpeed, 1f, 2.5f);
        animator.speed = speed;
    }

    private IEnumerator Play(float Delay)
    {

        yield return new WaitForSeconds(Delay);

        animator.SetBool("Play", true);

    }

    public void SetRendomVal() {


        meshRenderer.material.SetFloat("_TimeOffset", Random.Range(0f, 5f));

        float v = Random.Range(-1f, 1f);

        if (v <= 0)
        {
            float val = Random.Range(-0.5f, -0.2f);
            meshRenderer.material.SetFloat("_RotationSpeed", val);
        }
        else
        {
            float val = Random.Range(0.2f, 0.5f);
            meshRenderer.material.SetFloat("_RotationSpeed", val);
        }

  
    }
}
