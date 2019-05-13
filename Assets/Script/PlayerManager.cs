using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerManager : MonoBehaviour
{

    public SetParticleSpeed SetParticleSpeed;
    public List<Player> players = new List<Player>();

    void Awake() {
        EventCenter.AddListener(EventDefine.SetBGspeed, SetSpeed);
    }

    // Start is called before the first frame update
    void Start()
    {
       
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void SetSpeed() {
        float tempspeed = 0;
        foreach (var item in players)
        {
            tempspeed += item.currentSpeed;
        }

        //Debug.Log(tempspeed / players.Count);
        SetParticleSpeed.SetMoveSpeed( tempspeed / players.Count);
    }
}
