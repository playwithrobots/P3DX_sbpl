FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/P3DX_sbpl/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_cpp"
  "../msg_gen/cpp/include/P3DX_sbpl/sonar_msg.h"
  "../msg_gen/cpp/include/P3DX_sbpl/sbpl_msg.h"
  "../msg_gen/cpp/include/P3DX_sbpl/start_msg.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
