FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/P3DX_sbpl/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/P3DX_sbpl/msg/__init__.py"
  "../src/P3DX_sbpl/msg/_sonar_msg.py"
  "../src/P3DX_sbpl/msg/_sbpl_msg.py"
  "../src/P3DX_sbpl/msg/_start_msg.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
