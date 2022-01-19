% Configuration for techsweep_spectre_run.m
% Boris Murmann, Stanford University
% Tested with MMSIM12.11.134
% September 12, 2017
% Changed by Fengqi Zhang, Columbia University, July 2019
% Reset the Fils to the Skeleton
% Usage :
% 1. Replace XXX_ with Desired Name & Setting
% 2. Check the BSIM model for finger setting of nf or m and change _finger_
% Log : 2019-07-3
% 1. Change 180msrf to 180msrf
% 2. Set modelPath and corner
% 3. Set Temp to 27
% 4. Set nmosType & pmosType
% 5. Set max voltage : VGS_max, VDS_max, VSB_max
% 6. Set gate length : LENGTH
% 7. Change _finger_ to m
% Log :2021-12-12 by huangshu
% 1. change 180msrf to 181aBCD
% 2. Set modelPath and corner
% 3. Set Temp to 27
% 4. Set nmosType & pmosType
% 5. Set max voltage : VGS_max, VDS_max, VSB_max
% 6. Set gate length : LENGTH
% 7. Change _finger_ to multi
% Log :2021-12-22 by huangshu
% 1. ADD VDSAT in Variable mapping

function c = cornerSw_config_bsim3_181aBCD_spectre(corner)

% Models and file paths
c.corner = corner;
c.modelfile = sprintf('"/home/huangshu/Projects/DPDK_IC6p1_181abd18ba_Rev2p3/181abd18ba/../models/Spectre_lib/181aBD18BA_Rev2p3.scs" section=%s_svt050\n ', c.corner);
c.modelfile2 = sprintf('"/home/huangshu/Projects/DPDK_IC6p1_181abd18ba_Rev2p3/181abd18ba/../models/Spectre_lib/181aBD18BA_Rev2p3.scs" section=%s_dio\n ', c.corner);
c.modelfile3 = sprintf('"/home/huangshu/Projects/MATLAB/save.scs" \n ');
c.modelinfo = '181aBCD, BSIM4';
c.temp = 300;
c.modeln = 'nch_svt_iso_nbl_5p0v';
c.modelp = 'pch_svt_iso_nbl_5p0v';
c.savefilen = sprintf('181aBCD-nch-%s', c.corner);
c.savefilep = sprintf('181aBCD-pch-%s', c.corner);
%c.simcmd = 'source /home/huangshu/Projects/MATLAB/.bash_profile';
%c.simcmd = 'echo $path';
%c.simcmd = 'source /home/huangshu/Projects/MATLAB/.bash_profile';
c.simcmd = 'spectre +mt=4 techsweep_181aBCD.scs +log techsweep_181aBCD.out';
c.outfile = 'techsweep_181aBCD.raw';
c.sweep = 'sweepvds_sweepvgs-sweep';
c.sweep_noise = 'sweepvds_noise_sweepvgs_noise-sweep';

% Sweep parameters
c.VGS_step = 10e-3;
c.VDS_step = 10e-3;
c.VSB_step = 0.1;
c.VGS_max = 5;
c.VDS_max = 5;
c.VSB_max = 0.6;
c.VGS = 0:c.VGS_step:c.VGS_max;
c.VDS = 0:c.VDS_step:c.VDS_max;
c.VSB = flip(0:c.VSB_step:c.VSB_max);
%c.VSB = 0;
c.LENGTH = [0.5,0.6,0.7,0.8,1.0,1.5,2.0,3.0,4.0,5.0];
c.WIDTH = 5;
c.NFING = 1;

% Variable mapping
c.outvars =                      {'ID','VT','IGD','IGS','GM','GMB','GDS','CGG','CGS','CSG','CGD','CDG','CGB','CDD','CSS','FUG', 'GMOVERID', 'SELF_GAIN', 'VDSAT'};
c.n{1}= {'mn.m1:ids','A',         [1    0    0     0     0    0     0     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.n{2}= {'mn.m1:vth','V',         [0    1    0     0     0    0     0     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.n{3}= {'mn.m1:igd','A',         [0    0    1     0     0    0     0     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.n{4}= {'mn.m1:igs','A',         [0    0    0     1     0    0     0     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.n{5}= {'mn.m1:gm','S',          [0    0    0     0     1    0     0     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.n{6}= {'mn.m1:gmbs','S',        [0    0    0     0     0    1     0     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.n{7}= {'mn.m1:gds','S',         [0    0    0     0     0    0     1     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.n{8}= {'mn.m1:cgg','F',         [0    0    0     0     0    0     0     1     0     0     0     0     0     0     0     0        0            0     		0]};
c.n{9}= {'mn.m1:cgs','F',         [0    0    0     0     0    0     0     0    -1     0     0     0     0     0     0     0        0            0     		0]};
c.n{10}={'mn.m1:cgd','F',         [0    0    0     0     0    0     0     0     0     0    -1     0     0     0     0     0        0            0     		0]};
c.n{11}={'mn.m1:cgb','F',         [0    0    0     0     0    0     0     0     0     0     0     0    -1     0     0     0        0            0     		0]};
c.n{12}={'mn.m1:cdd','F',         [0    0    0     0     0    0     0     0     0     0     0     0     0     1     0     0        0            0     		0]};
c.n{13}={'mn.m1:cdg','F',         [0    0    0     0     0    0     0     0     0     0     0    -1     0     0     0     0        0            0     		0]};
c.n{14}={'mn.m1:css','F',         [0    0    0     0     0    0     0     0     0     0     0     0     0     0     1     0        0            0     		0]};
c.n{15}={'mn.m1:csg','F',         [0    0    0     0     0    0     0     0     0    -1     0     0     0     0     0     0        0            0     		0]};
c.n{16}={'mn.m1:cjd','F',         [0    0    0     0     0    0     0     0     0     0     0     0     0     1     0     0        0            0     		0]};
c.n{17}={'mn.m1:cjs','F',         [0    0    0     0     0    0     0     0     0     0     0     0     0     0     1     0        0            0     		0]};
c.n{18}={'mn.m1:fug','Hz',        [0    0    0     0     0    0     0     0     0     0     0     0     0     0     0     1        0            0     		0]};
c.n{19}={'mn.m1:gmoverid','V',    [0    0    0     0     0    0     0     0     0     0     0     0     0     0     0     0        1            0     		0]};
c.n{20}={'mn.m1:self_gain','real',[0    0    0     0     0    0     0     0     0     0     0     0     0     0     0     0        0            1     		0]};
c.n{20}={'mn.m1:vdsat','V',       [0    0    0     0     0    0     0     0     0     0     0     0     0     0     0     0        0            0     		1]};
%		
%                                {'ID','VT','IGD','IGS','GM','GMB','GDS','CGG','CGS','CSG','CGD','CDG','CGB','CDD','CSS','FUG', 'GMOVERID', 'SELF_GAIN', 'VDSAT'};
c.p{1}= {'mp.m1:ids','A',         [-1   0    0     0     0    0     0     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.p{2}= {'mp.m1:vth','V',         [0   -1    0     0     0    0     0     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.p{3}= {'mp.m1:igd','A',         [0    0   -1     0     0    0     0     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.p{4}= {'mp.m1:igs','A',         [0    0    0    -1     0    0     0     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.p{5}= {'mp.m1:gm','S',          [0    0    0     0     1    0     0     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.p{6}= {'mp.m1:gmbs','S',        [0    0    0     0     0    1     0     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.p{7}= {'mp.m1:gds','S',         [0    0    0     0     0    0     1     0     0     0     0     0     0     0     0     0        0            0     		0]};
c.p{8}= {'mp.m1:cgg','F',         [0    0    0     0     0    0     0     1     0     0     0     0     0     0     0     0        0            0     		0]};
c.p{9}= {'mp.m1:cgs','F',         [0    0    0     0     0    0     0     0    -1     0     0     0     0     0     0     0        0            0     		0]};
c.p{10}={'mp.m1:cgd','F',         [0    0    0     0     0    0     0     0     0     0    -1     0     0     0     0     0        0            0     		0]};
c.p{11}={'mp.m1:cgb','F',         [0    0    0     0     0    0     0     0     0     0     0     0    -1     0     0     0        0            0     		0]};
c.p{12}={'mp.m1:cdd','F',         [0    0    0     0     0    0     0     0     0     0     0     0     0     1     0     0        0            0     		0]};
c.p{13}={'mp.m1:cdg','F',         [0    0    0     0     0    0     0     0     0     0     0    -1     0     0     0     0        0            0     		0]};
c.p{14}={'mp.m1:css','F',         [0    0    0     0     0    0     0     0     0     0     0     0     0     0     1     0        0            0     		0]};
c.p{15}={'mp.m1:csg','F',         [0    0    0     0     0    0     0     0     0    -1     0     0     0     0     0     0        0            0     		0]};
c.p{16}={'mp.m1:cjd','F',         [0    0    0     0     0    0     0     0     0     0     0     0     0     1     0     0        0            0     		0]};
c.p{17}={'mp.m1:cjs','F',         [0    0    0     0     0    0     0     0     0     0     0     0     0     0     1     0        0            0     		0]};
c.p{18}={'mp.m1:fug','Hz',        [0    0    0     0     0    0     0     0     0     0     0     0     0     0     0     1        0            0     		0]};
c.p{19}={'mp.m1:gmoverid','V',    [0    0    0     0     0    0     0     0     0     0     0     0     0     0     0     0        1            0     		0]};
c.p{20}={'mp.m1:self_gain','real',[0    0    0     0     0    0     0     0     0     0     0     0     0     0     0     0        0            1     		0]};
c.p{20}={'mp.m1:vdsat','V',       [0    0    0     0     0    0     0     0     0     0     0     0     0     0     0     0        0            0     		-1]};
%
c.outvars_noise = {'STH','SFL'};
c.n_noise{1}= {'mn.m1:id', ''};
c.n_noise{2}= {'mn.m1:fn', ''};
%
c.p_noise{1}= {'mp.m1:id', ''};
c.p_noise{2}= {'mp.m1:fn', ''};


% Simulation netlist
netlist = sprintf([...
'simulator lang=spectre\n'...
'global 0\n'...
'//techsweep_181aBCD.scs \n'...
'include  %s'...
'include "/home/huangshu/Projects/DPDK_IC6p1_181abd18ba_Rev2p3/181abd18ba/../models/Spectre_lib/181aBD18BA_Rev2p3.scs" section=norflag_svt050\n'...
'include  %s'...
'include  %s'...
'include "techsweep_params_181aBCD.scs" \n'...
'save mn \n'...
'save mp \n'...
'parameters gs=0 ds=0 \n'...
'vnoi     (vx  0)         vsource dc=0   \n'...
'vdsn     (vdn vx)        vsource dc=ds  \n'...
'vgsn     (vgn 0)         vsource dc=gs  \n'...
'vbsn     (vbn 0)         vsource dc=-sb \n'...
'vison    (vin  0)        vsource dc=5   \n'...
'vdsp     (vdp vx)        vsource dc=-ds \n'...
'vgsp     (vgp 0)         vsource dc=-gs \n'...
'vbsp     (vbp 0)         vsource dc=sb  \n'...
'visop    (vip  0)        vsource dc=-5  \n'...
'\n'...
'mn       (vdn vgn 0 vbn vin 0) %s  l=length*1e-6 w=%de-6 multi=%d \n'...
'mp       (vdp vgp 0 vbp 0 vip 0) %s  l=length*1e-6 w=%de-6 multi=%d \n'...
'\n'...
'simOptions options gmin=1e-13 reltol=1e-4 vabstol=1e-6 iabstol=1e-10 temp=%d tnom=27 rawfmt=psfbin rawfile="./%s" \n'...
'sweepvds sweep param=ds start=0 stop=%d step=%d { \n'...
'   sweepvgs dc param=gs start=0 stop=%d step=%d \n'...
'}\n'...
'sweepvds_noise sweep param=ds start=0 stop=%d step=%d { \n'...
'   sweepvgs_noise noise freq=1 oprobe=vnoi param=gs start=0 stop=%d step=%d \n'...
'}\n'...
], c.modelfile3, c.modelfile2, c.modelfile, ...
c.modeln, c.WIDTH, c.NFING, ...
c.modelp, c.WIDTH, c.NFING, ...
c.temp-273, c.outfile, ...
c.VGS_max, c.VGS_step, ...
c.VDS_max, c.VDS_step, ...
c.VGS_max, c.VGS_step, ...
c.VDS_max, c.VDS_step);

% Write netlist
fid = fopen('techsweep_181aBCD.scs', 'w');
fprintf(fid, netlist);
fclose(fid);

return

