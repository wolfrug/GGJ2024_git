using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

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
}
