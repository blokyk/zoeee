let
  pins = import ./npins {};
  pkgs = import pins.nixpkgs {};
  vscode-ext-hook = pkgs.callPackage pins.vscode-ext-hook.outPath {};
in
with pkgs;
mkShell {
  packages = [
    vscode-ext-hook
  ];

  vscodeExtensions =
    let
      nixExts = with vscode-extensions; [
        ms-vscode.live-server
      ];

      mktplcExts = vscode-utils.extensionsFromVscodeMarketplace [
      ];
    in
     nixExts ++ mktplcExts;
}