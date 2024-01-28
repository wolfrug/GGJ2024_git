using System.Collections;
using System.Collections.Generic;
using InkEngine;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.SceneManagement;

[System.Serializable]
public class GameStateChanged : UnityEvent<GameState> { }

public enum GameStateEnum
{
    NONE = 0000,
    INIT = 1000,
    GAME = 2000,
    STORY = 3000,
    WIN = 4000,
    DEFEAT = 5000,

}

[System.Serializable]
public class GameState
{
    public GameStateEnum m_state;
    public GameStateChanged m_action;

    public void SetState()
    {
        GameManager.GameState = this;
        m_action.Invoke(this);
    }
}

public class GameManager : MonoBehaviour
{
    public static GameManager instance;
    public InkStoryData m_inkstorydata;
    public List<GameState> m_gameStates = new List<GameState> { };

    void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
        else
        {
            Destroy(gameObject);
        }
    }
    void Start()
    {
        SetGameState(GameStateEnum.INIT);
    }

    public void SetGameState(GameStateEnum state)
    {
        m_gameStates.Find((x) => x.m_state == state).SetState();
    }

    public static GameState GameState
    {
        set;
        get;
    }

    public void EndGameWin()
    {
        m_inkstorydata.ClearSavedStory();
        SceneManager.LoadScene("EndGame_Win");
    }
    public void EndGameLose(){
        m_inkstorydata.ClearSavedStory();
        SceneManager.LoadScene("EndGame_Lose"); 
    }
}
