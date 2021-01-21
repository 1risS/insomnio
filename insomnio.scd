p = "HOME".getenv ++ "/insomnio/sol/"; // path for Mac/Linux
//File.mkdir(p)

(
~convertToWav = {|dirname|
	var p = PathName.new(dirname);
	p.files.do{ |file|
		if (file.extension == "ogg") {
			var dst = file.pathOnly +/+"%.%".format(file.fileNameWithoutExtension, "wav");
			"/usr/local/bin/sox % %".format(file.fullPath.shellQuote, dst.shellQuote).unixCmdGetStdOut;
		};
	};
};
)

~alborada = MIRLCRep.new(path: p);

/*

~samplesDir = Platform.userHomeDir +/+ "insomnio/preview"
File.mkdir(~samplesDir)

(
~preview = ~snd.retrievePreview(~samplesDir, {
        ~buf = Buffer.read(s, ~samplesDir +/+ ~snd.previewFilename);
        "done!".postln;
});

~samplesDir +/+ ~snd.previewFilename.postln;
)

~buf.play;
~buf.bufnum
*/

//|tag, size = 1, feature = 'dur', fvalue = 1, fx = 'conf', fxvalue = 'bypass'|
~alborada.combine('sun', 5, fvalue: 6)

~alborada.sequence

s.scope

(
~convertToWav.(p)
~dirt.loadSoundFiles(Platform.userHomeDir +/+ "insomnio/*")
)