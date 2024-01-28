using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class StartGame : MonoBehaviour
{
    public Button startButton;
    public string mainScene;

    void Start(){
        startButton.onClick.AddListener(()=>SceneManager.LoadScene(mainScene));
    }

}
