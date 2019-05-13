using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TillingUV : MonoBehaviour
{

    private MeshRenderer meshRenderer;

    private float currentTilling;

    public float speed = 0.2f;

    void Awake() {
        meshRenderer = this.GetComponent<MeshRenderer>();
    }
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        Titling(speed);
    }

    public void Titling(float Speed) {
        currentTilling -= Time.deltaTime * Speed;
        if (currentTilling <= -1) {
            currentTilling = 0;
        }

        Vector2 titling = new Vector2(0, currentTilling);

        //meshRenderer.material.SetTextureOffset("_AlbedoTex", titling);
        meshRenderer.material.SetTextureOffset("_EmissionTex", titling);

    }
}
