float CalculateOutline(sampler2D tex, float2 uv, float2 texel_size, float size) {
    float2 disc[16] = {
        float2(0, 1),
        float2(0.3826835, 0.9238796),
        float2(0.7071069, 0.7071068),
        float2(0.9238796, 0.3826834),
        float2(1, 0),
        float2(0.9238795, -0.3826835),
        float2(0.7071068, -0.7071068),
        float2(0.3826833, -0.9238796),
        float2(0, -1),
        float2(-0.3826835, -0.9238796),
        float2(-0.7071069, -0.7071067),
        float2(-0.9238797, -0.3826832),
        float2(-1, 0),
        float2(-0.9238795, 0.3826835),
        float2(-0.7071066, 0.707107),
        float2(-0.3826834, 0.9238796)
    };
    
    float max_alpha = 0;

    for(int i=0;i<16;i++) {
        float sample_alpha = tex2D(tex, uv + disc[i] * texel_size * size).a;
        max_alpha += max(sample_alpha, max_alpha);
    }

    return max_alpha;
}