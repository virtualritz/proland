/*
 * Proland: a procedural landscape rendering library.
 * Copyright (c) 2008-2011 INRIA
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Authors: Eric Bruneton, Antoine Begault, Guillaume Piolat.
 */

#ifdef _VERTEX_

layout(location=0) in vec4 vertex;
out vec2 uv;

void main() {
    gl_Position = vertex;
    uv = vertex.xy * 0.5 + vec2(0.5);
}

#endif

#ifdef _FRAGMENT_

#include "globalsShader.glhl"

uniform sampler2D colorSampler;
uniform sampler2D depthSampler;

in vec2 uv;
layout(location=0) out vec4 data;

void main() {
    data.rgb = textureLod(colorSampler, uv, 0.0).rgb;
    gl_FragDepth = texture(depthSampler, uv).x;
}

#endif