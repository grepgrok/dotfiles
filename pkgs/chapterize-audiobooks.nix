{
    lib,
    pkgs,
    buildPythonPackage,
    fetchFromGitHub,
    vosk,
    ...
}:
buildPythonPackage rec {
    pname = "chapterize-audiobooks";
    version = "0.6.0";

    srcs = fetchFromGitHub {
        owner = "patrickenfuego";
        repo = "Chapterize-Audiobooks";
        rev = "v0.6.0";
        sha256 = "sha256-Cd1XzWp2hYUSHnm/Kndxy0jQq0PomVSux9LM7dv2Rqc=";
    };

    preBuild = ''
      cat > pyproject.toml << EOF
[build-system]
requires = ["setuptools"]
build-backend = "setuptools.build_meta"

[project]
name = "chapterize-audiobooks"
version = "0.6.0"
dependencies = [
    "rich>=12.6.0",
    "vosk>=0.3.44",
    "requests>=2.28.0"
]

[project.scripts]
chapterize-audiobooks = "chapterize_ab:main"

[tool.setuptools]
py-modules = ["chapterize_ab"]
EOF
    '';
    pyproject = true;
    build-system = with pkgs.python3Packages; [
        setuptools
        wheel
    ];

    pythonPath = with pkgs.python3Packages; [
        # ffmpeg-python
        rich
        vosk
        requests
    ];

    propagatedBuildInputs = [ pkgs.ffmpeg ];

    meta = {
        description = "Split a single, monolithic mp3 audiobook file into chapters using Machine Learning and ffmpeg.";
        homepage = "https://github.com/patrickenfuego/Chapterize-Audiobooks";
        license = lib.licenses.asl20;
        platforms = lib.platforms.all;
        badPlatforms = [ ];
    };
}
