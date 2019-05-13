using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SetImageScale : MonoBehaviour
{
    RectTransform M_rectTransform;
    Image image;
    // Start is called before the first frame update
    void Awake()
    {
        M_rectTransform = this.GetComponent<RectTransform>();
        image = this.GetComponent<Image>();
        setNodeImageScale(image.sprite);
    }

    // Update is called once per frame
    void Update()
    {
        
    }


    private void setNodeImageScale(Sprite sprite)
    {
        M_rectTransform.sizeDelta = new Vector2(M_rectTransform.rect.width, CalcuateHeight(sprite));
   
    }


    private float CalculateWidth(Sprite sprite)
    {
        float temp;
        temp = M_rectTransform.rect.height* sprite.rect.width / sprite.rect.height;
        return temp;
    }

    private float CalcuateHeight(Sprite sprite)
    {
        float temp;
        temp = M_rectTransform.rect.width * sprite.rect.height / sprite.rect.width;
       // Debug.Log(temp);

        return temp;
    }
}
