<project xmlns="com.autoesl.autopilot.project" top="" name="risc_v" projectType="C/C++">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../src/c_files/libcpu.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../src/h_files/libcpu.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../src/c_files/libmem.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../src/h_files/libmem.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../../../src/main.c" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="zedboard" status="active"/>
    </solutions>
</project>

