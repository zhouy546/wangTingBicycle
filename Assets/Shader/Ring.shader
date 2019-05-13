// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "my/Ring"
{
	Properties
	{
		_EmissionTex("EmissionTex", 2D) = "white" {}
		_EmissionColor("EmissionColor", Color) = (0,0,0,0)
		_RestColor("RestColor", Color) = (0.4716981,0.4716981,0.4716981,0)
		_NeonIntensity("NeonIntensity", Range( 0 , 5)) = 1
		_RotationSpeed("RotationSpeed", Float) = 0
		_TimeOffset("TimeOffset", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard alpha:fade keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _EmissionTex;
		uniform float _TimeOffset;
		uniform float _RotationSpeed;
		uniform float4 _EmissionColor;
		uniform float _NeonIntensity;
		uniform float4 _RestColor;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 appendResult17 = (float2(( _TimeOffset + ( _Time.y * _RotationSpeed ) ) , 0.0));
			float2 uv_TexCoord14 = i.uv_texcoord + appendResult17;
			float4 tex2DNode1 = tex2D( _EmissionTex, uv_TexCoord14 );
			float3 appendResult6 = (float3((1.0 + (tex2DNode1.r - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) , (1.0 + (tex2DNode1.g - 0.0) * (0.0 - 1.0) / (1.0 - 0.0)) , (1.0 + (tex2DNode1.b - 0.0) * (0.0 - 1.0) / (1.0 - 0.0))));
			o.Emission = ( ( tex2DNode1 * _EmissionColor * _NeonIntensity ) + ( float4( appendResult6 , 0.0 ) * _RestColor ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16500
7;1;1398;1010;2485.98;776.534;1.02826;True;True
Node;AmplifyShaderEditor.SimpleTimeNode;15;-2090.103,-532.8363;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;18;-2039.717,-176.0303;Float;False;Property;_RotationSpeed;RotationSpeed;4;0;Create;True;0;0;False;0;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-1792.932,-496.8472;Float;False;Property;_TimeOffset;TimeOffset;5;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1765.171,-337.467;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;22;-1625.326,-450.5755;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;17;-1489.594,-360.0887;Float;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;14;-1362.708,-409.0668;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-991.8317,-414.4113;Float;True;Property;_EmissionTex;EmissionTex;0;0;Create;True;0;0;False;0;4b50bbb54ea2a0841976e1407bd1864d;4b50bbb54ea2a0841976e1407bd1864d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;7;-602.9905,532.1562;Float;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;5;-585.3232,352.1561;Float;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;8;-594.3239,698.8229;Float;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-301.4608,18.69879;Float;False;Property;_NeonIntensity;NeonIntensity;3;0;Create;True;0;0;False;0;1;3.52;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;11;-191.1174,896.5024;Float;False;Property;_RestColor;RestColor;2;0;Create;True;0;0;False;0;0.4716981,0.4716981,0.4716981,0;0.2169811,0.2169811,0.2169811,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;6;-229.1795,466.1795;Float;True;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;3;-979.3134,-154.1338;Float;False;Property;_EmissionColor;EmissionColor;1;0;Create;True;0;0;False;0;0,0,0,0;0,0.5804839,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;76.26965,483.1079;Float;True;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;186.8834,-211.0547;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;12;340.6202,152.3925;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;466.3502,-151.8141;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;my/Ring;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;True;0;False;Transparent;;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;19;0;15;0
WireConnection;19;1;18;0
WireConnection;22;0;20;0
WireConnection;22;1;19;0
WireConnection;17;0;22;0
WireConnection;14;1;17;0
WireConnection;1;1;14;0
WireConnection;7;0;1;2
WireConnection;5;0;1;1
WireConnection;8;0;1;3
WireConnection;6;0;5;0
WireConnection;6;1;7;0
WireConnection;6;2;8;0
WireConnection;10;0;6;0
WireConnection;10;1;11;0
WireConnection;2;0;1;0
WireConnection;2;1;3;0
WireConnection;2;2;13;0
WireConnection;12;0;2;0
WireConnection;12;1;10;0
WireConnection;0;2;12;0
ASEEND*/
//CHKSM=4F4A53FA0702F5C6843CA8D2D55362BF5C2A0A52