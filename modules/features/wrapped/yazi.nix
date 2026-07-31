{ self, inputs, ... }: {
	perSystem = { pkgs, lib, ... }: {
		packages.myYazi = inputs.wrapper-modules.wrappers.yazi.wrap {
			inherit pkgs;
			runtimePkgs = [ pkgs.micro ];
			settings.yazi.mgr.show_hidden = true;
			settings.yazi.opener.play = [ { run = "mpv %s"; orphan = true; } ];
			settings.yazi.opener.edit = [ { run = "micro %s"; block = true; } ];
		};
	};
}
