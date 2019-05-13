using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ArrowTriggerBox : MonoBehaviour
{
    public Transform SpawnPos;
  //  public BoxCollider boxCollider;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Arrow") {
            other.transform.position = new Vector3(other.transform.position.x, other.transform.position.y, SpawnPos.position.z);
        }
    }
}
