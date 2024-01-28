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

     public void PlayMusic(InkDialogueLine line, InkTextVariable variable)
    {
        MusicType musicType = MusicType.NONE;
        string targetMusicType = variable.VariableArguments[0];
        System.Enum.TryParse<MusicType>(targetMusicType, out musicType);
        if (musicType != MusicType.NONE)
        {
            AudioManager.Instance.PlayMusic(musicType, true);
        }
        else
        {
            Debug.Log("Could not find music of type " + targetMusicType);
            AudioManager.Instance.PlayMusic(MusicType.NONE, true);
        }
    }
    public void PlayAmbience(InkDialogueLine line, InkTextVariable variable)
    {
        AmbienceType ambienceType = AmbienceType.NONE;
        string targetAmbienceType = variable.VariableArguments[0];
        System.Enum.TryParse<AmbienceType>(targetAmbienceType, out ambienceType);
        if (ambienceType != AmbienceType.NONE)
        {
            AudioManager.Instance.PlayAmbience(ambienceType, true);
        }
        else
        {
            Debug.Log("Could not find ambience of type " + targetAmbienceType);
            AudioManager.Instance.PlayAmbience(AmbienceType.NONE, true);
        }
    }

    public void PlaySFX(InkDialogueLine line, InkTextVariable variable)
    {
        SFXType sfxType = SFXType.NONE;
        string targetSFXType = variable.VariableArguments[0];
        System.Enum.TryParse<SFXType>(targetSFXType, out sfxType);
        if (sfxType != SFXType.NONE)
        {
            AudioManager.Instance.PlaySFX(sfxType);
        }
        else
        {
            Debug.Log("Could not find SFX of type " + targetSFXType);
        }
    }


    public void EndGameWin()
    {
        m_inkstorydata.ClearSavedStory();
        SceneManager.LoadScene("EndScene_Win");
    }
    public void EndGameLose(){
        m_inkstorydata.ClearSavedStory();
        SceneManager.LoadScene("EndScene_Lose"); 
    }
}
