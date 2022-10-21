using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class IpText : MonoBehaviour
{
    public InputField iptext;
    string webip;
    
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public string Roscusttomurl()
    {
        webip = iptext.text;
        Debug.Log(webip);

        SceneManager.LoadScene("xycar");

        return webip;
    }
}
