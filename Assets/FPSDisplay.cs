using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FPSDisplay : MonoBehaviour {

    private void OnGUI() {
        int fps = (int) (1.0f / Time.smoothDeltaTime);
        GUI.Label(new Rect(5, 5, 100, 100), "FPS: " + fps.ToString());
    }
	
}
