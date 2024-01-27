using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace InkEngine {
    public class InkListSpriteDisplayer : MonoBehaviour {
        public InkStoryData m_storyData;
        [Tooltip ("List ID, e.g. LIST myList = bla --> myList")]
        public string m_listID = "";
        public Image m_targetImage;
        public Sprite m_nullSprite;
        public List<InkSpriteWithID> m_spriteList = new List<InkSpriteWithID> { };
        public InkStoryVariableData m_defaultSprites;
        public bool m_initOnStart = true;
        public bool m_initOnEnable = true;
        private Dictionary<string, InkSpriteWithID> m_spriteDict = new Dictionary<string, InkSpriteWithID> { };
        void Awake () {
            foreach (InkSpriteWithID ils in m_spriteList) {
                m_spriteDict.Add (ils.id, ils);
            }
            if (m_defaultSprites != null) {
                foreach (InkSpriteWithID isid in m_defaultSprites.m_sprites) {
                    m_spriteDict.Add (isid.id, isid);
                }
            }
        }
        void Start () {
            if (m_targetImage == null){
                m_targetImage = GetComponent<Image>();
            }
            if (m_initOnStart) {
                UpdateFromInk ();
            }
        }
        void OnEnable () {
            if (m_targetImage == null){
                m_targetImage = GetComponent<Image>();
            }
            if (m_initOnEnable) {
                UpdateFromInk ();
            }
        }

        public void UpdateFromInk () {
            //Debug.Log ("Attempting to update from ink for id " + m_listID);
            // Id must equal the name of the variable in Ink
            if (m_storyData != null && m_storyData.IsLoaded () && m_listID != "") {
                var newList = m_storyData.InkStory.variablesState[m_listID] as Ink.Runtime.InkList;
                SetNullSprite ();
                if (newList.Count > 0) {
                    foreach (var item in newList) {
                        Debug.Log ("<color=red>Value of item with name " + item.Key.itemName + " is " + item.Value + "</color>");
                        InkSpriteWithID tryGetSprite = null;
                        m_spriteDict.TryGetValue (item.Key.itemName, out tryGetSprite);
                        if (tryGetSprite != null) {
                            m_targetImage.sprite = tryGetSprite.sprite;
                            m_targetImage.enabled = true;
                            break;
                        }
                    }
                }
            } else {
                if (m_storyData == null || !m_storyData.IsLoaded ()) {
                    Debug.LogWarning ("Cannot find loaded Ink Story");
                }
                SetNullSprite ();
            }
        }
        void SetNullSprite () {
            if (m_nullSprite != null) {
                m_targetImage.sprite = m_nullSprite;
                m_targetImage.enabled = true;
            } else {
                m_targetImage.enabled = false;
            }
        }
        [NaughtyAttributes.Button]
        void AutoSet(){
            m_spriteList[0].id = name;
        }
    }
}