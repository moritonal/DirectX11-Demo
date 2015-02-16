#include <VS_Input.hlsli>

cbuffer VS_ConstantBuffer : register(b0)
{
	matrix View;
	matrix Projection;
}

cbuffer VS_QuickConstantBuffer : register(b1)
{
	matrix World;
}

VsOut main(VsIn input)
{
	VsOut output = (VsOut)0;

	output.Pos.xy += input.Pos;

	output.Pos.z = 0;
	output.Pos.w = 1;

	output.Pos = mul(output.Pos, transpose(World));
	
	output.Pos = mul(output.Pos, View);

	output.Pos = mul(output.Pos, Projection);

	output.Pos.z = 0;
	output.Pos.w = 1;

	output.texCoord = input.texCoord;

	output.col = float4(1, 1, 1, 1);

	return output;
}