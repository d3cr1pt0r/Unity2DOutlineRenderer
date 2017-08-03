using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterRender : MonoBehaviour {

    [SerializeField] private Material material;

    private Texture texture_;
    private RenderTexture render_texture_;

    private void OnRenderImage(RenderTexture source, RenderTexture destination) {
        if (material == null) {
            return;
        }

        Graphics.Blit(source, destination, material);
    }

}
