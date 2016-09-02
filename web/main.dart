// Copyright (c) 2016, RobertMcdermot. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:async';
import 'package:stagexl/stagexl.dart';

ResourceManager RESOURCES = new ResourceManager();

Future main() async {
	StageXL.stageOptions
		..transparent = true
		..backgroundColor = 0x00000000;

	RESOURCES.addBitmapData('character', 'character.png');
	await RESOURCES.load();

	Stage negativeStage = new Stage(querySelector('#negativeStage'));
	Stage positiveStage = new Stage(querySelector('#positiveStage'));
	RenderLoop renderLoop = new RenderLoop()
		..addStage(negativeStage)
		..addStage(positiveStage);

	negativeStage.addChild(new Character(0, 0, 0));
	negativeStage.addChild(new Character(150, 0, -.25));
	negativeStage.addChild(new Character(0, 150, -.5));
	negativeStage.addChild(new Character(150, 150, -1));

	positiveStage.addChild(new Character(0, 0, 0));
	positiveStage.addChild(new Character(150, 0, .25));
	positiveStage.addChild(new Character(0, 150, .5));
	positiveStage.addChild(new Character(150, 150, 1));
}

class Character extends Sprite {
	num x, y, contrast;

	Character(this.x, this.y, this.contrast) {
		Bitmap image = new Bitmap(RESOURCES.getBitmapData('character'));
		image.filters.add(new ColorMatrixFilter.adjust(contrast: contrast));
		image.x = x;
		image.y = y;
		addChild(image);
	}
}
