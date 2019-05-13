using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FinishedUI : MonoBehaviour
{
    private Animator animator;

    void Awake() {
        animator = this.GetComponent<Animator>();
    }

    // Start is called before the first frame update
    void Start()
    {
        Hide();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void show() {
        animator.SetBool("Show", true);
    }

    public void Hide() {
        animator.SetBool("Show", false);
    }
}
