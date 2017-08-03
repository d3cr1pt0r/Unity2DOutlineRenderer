using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterRotationController : MonoBehaviour {

    [SerializeField] private float speed = 10.0f;

    private Vector3 lastMousePosition = Vector3.zero;
    private Vector3 deltaMousePosition = Vector3.zero;

    private void Update() {
        // touch delta position
        if (Input.touchCount > 0) {
            Touch touch = Input.GetTouch(0);

            if (touch.phase == TouchPhase.Moved) {
                deltaMousePosition = Input.GetTouch(0).deltaPosition;
            }
        }

        // mouse delta position
        if (Input.GetMouseButton(0)) {
            Vector3 currentPosition = Input.mousePosition;
            deltaMousePosition = currentPosition - lastMousePosition;
            lastMousePosition = currentPosition;
        } else {
            lastMousePosition = Input.mousePosition;
        }

        // rotate character by delta position x
        if (deltaMousePosition != Vector3.zero) {
            transform.Rotate(new Vector3(0, -deltaMousePosition.x, 0));
        }
    }
}
