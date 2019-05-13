// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "my/Base"
{
	Properties
	{
		_EmissionTex("EmissionTex", 2D) = "white" {}
		_EmissionColor("EmissionColor", Color) = (0,0,0,0)
		_RestColor("RestColor", Color) = (0.4716981,0.4716981,0.4716981,0)
		_NeonIntensity("NeonIntensity", Range( 0 , 5)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _EmissionTex;
		uniform float4 _EmissionTex_ST;
		uniform float4 _EmissionColor;
		uniform float _NeonIntensity;
		uniform float4 _RestColor;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_EmissionTex = i.uv_texcoord * _EmissionTex_ST.xy + _EmissionTex_ST.zw;
			float4 tex2DNode1 = tex2D( _EmissionTex, uv_EmissionTex );
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
7;1;1398;1010;2517.954;859.6286;1.39704;True;True
Node;AmplifyShaderEditor.SamplerNode;1;-991.8317,-414.4113;Float;True;Property;_EmissionTex;EmissionTex;0;0;Create;True;0;0;False;0;4b50bbb54ea2a0841976e1407bd1864d;4c106544ea8072943840e06abdfb07b3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;8;-594.3239,698.8229;Float;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;7;-602.9905,532.1562;Float;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;5;-585.3232,352.1561;Float;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;6;-229.1795,466.1795;Float;True;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;11;-191.1174,896.5024;Float;False;Property;_RestColor;RestColor;2;0;Create;True;0;0;False;0;0.4716981,0.4716981,0.4716981,0;0.1792453,0.1792453,0.1792453,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;3;-979.3134,-154.1338;Float;False;Property;_EmissionColor;EmissionColor;1;0;Create;True;0;0;False;0;0,0,0,0;0.04313726,0.7294118,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;13;-301.4608,18.69879;Float;False;Property;_NeonIntensity;NeonIntensity;3;0;Create;True;0;0;False;0;1;3.52;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;76.26965,483.1079;Float;True;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;186.8834,-211.0547;Float;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;12;340.6202,152.3925;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;466.3502,-151.8141;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;my/Base;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;8;0;1;3
WireConnection;7;0;1;2
WireConnection;5;0;1;1
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
//CHKSM=A3FA7F448A7CFB2B23A4BA4E2E734E9233C52935