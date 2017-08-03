Shader "d3cr1pt0r/CharacterRender"
{
	Properties {
		_MainTex ("Main Texture", 2D) = "white" {}
        _OutlineDistance("Outline Distance", Range(0, 100)) = 1
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"
            #include "Outline.cginc"

			sampler2D _MainTex;
			float4 _MainTex_ST;
            float2 _MainTex_TexelSize;
            half _OutlineDistance;

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float2 uv1 : TEXCOORD0;
			};
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv1 = TRANSFORM_TEX(v.uv, _MainTex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 render_texture = tex2D(_MainTex, i.uv1);
                //render_texture.rgb = dot(render_texture.rgb, fixed3(0.3, 0.59, 0.11));
                render_texture.a = max(render_texture.a, CalculateOutline(_MainTex, i.uv1, _MainTex_TexelSize, _OutlineDistance));
				return render_texture;
			}
			ENDCG
		}
	}
}
