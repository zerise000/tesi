<project xmlns="com.autoesl.autopilot.project" top="" name="risc-v" projectType="C/C++">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" profile="true" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../src/cpp_files/libcpu.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../src/h_files/libcpu.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../src/cpp_files/libmem.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../src/h_files/libmem.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../../../src/main.cpp" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution" status="active"/>
    </solutions>
</project>

