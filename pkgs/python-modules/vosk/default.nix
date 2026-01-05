{
    lib,
    pkgs,
    buildPythonPackage,
    fetchFromGitHub,
    fetchPypi,
    vosk,
    ...
}:
buildPythonPackage rec {
    pname = "vosk";
    version = "0.3.45";

    src = fetchFromGitHub {
        owner = "alphacep";
        repo = "vosk-api";
        rev = "v${version}";
        sha256 = "sha256-E0Xl+TbI06ArHSk1t6DsXLUlfMQZGKQMTp7smGxgp2Y=";
    };

    sourceRoot = "${src.name}/python";

    postPatch = ''
        substituteInPlace vosk/__init__.py \
            --replace "dlldir = os.path.abspath(os.path.dirname(__file__))" 'dlldir = "${vosk}/lib"'
    '';

    doCheck = false;

    pyproject = true;
    build-system = with pkgs.python3Packages; [
        setuptools
        wheel
    ];

    propagatedBuildInputs = with pkgs.python3Packages; [
        cffi
        requests
        srt
        tqdm
        websockets
    ];

    meta = {
        description = "Offline open source speech recognition API based on Kaldi and Vosk";
        homepage = "https://github.com/alphacep/vosk-api";
        license = lib.licenses.asl20;
        platforms = lib.platforms.all;
        badPlatforms = [ ];
    };
}
