using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using InkEngine;
using UnityEngine.UI;

[RequireComponent(typeof(Button))]
public class SimpleInkVariableButton : MonoBehaviour
{
    public InkStoryData m_targetStory;
    public string m_targetVariable;

    public void ChangeInteger(int amount){
        m_targetStory.InkStory.variablesState[m_targetVariable] = (int) m_targetStory.InkStory.variablesState[m_targetVariable] + amount;
    }
}
