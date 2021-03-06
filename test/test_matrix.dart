part of vector_math_test;

class MatrixTest extends BaseTest {

  void testMatrixTranspose() {
    List<dynamic> inputA = new List<dynamic>();
    List<dynamic> expectedOutput = new List<dynamic>();
    inputA.add(parseMatrix('''0.337719409821377   0.780252068321138   0.096454525168389   0.575208595078466
                           0.900053846417662   0.389738836961253   0.131973292606335   0.059779542947156
                           0.369246781120215   0.241691285913833   0.942050590775485   0.234779913372406
    0.111202755293787   0.403912145588115   0.956134540229802   0.353158571222071'''));
    expectedOutput.add(inputA[0].transposed());

    for (int i = 0; i < inputA.length; i++) {
      inputA[i].transpose();
      relativeTest(inputA[i], expectedOutput[i]);
    }
  }

  void testMatrixVectorMultiplication() {
    List<dynamic> inputA = new List<dynamic>();
    List<dynamic> inputB = new List<dynamic>();
    List<dynamic> expectedOutput = new List<dynamic>();

    inputA.add(parseMatrix('''0.337719409821377   0.780252068321138   0.096454525168389   0.575208595078466
   0.900053846417662   0.389738836961253   0.131973292606335   0.059779542947156
   0.369246781120215   0.241691285913833   0.942050590775485   0.234779913372406
   0.111202755293787   0.403912145588115   0.956134540229802   0.353158571222071'''));
    inputB.add(parseVector('''0.821194040197959
   0.015403437651555
   0.043023801657808
   0.168990029462704'''));
    expectedOutput.add(parseVector('''0.390706088480722
   0.760902311900085
   0.387152194918898
   0.198357495624973'''));
    /*
    inputA.add(parseMatrix('''0.780227435151377   0.929385970968730   0.486791632403172
   0.081125768865785   0.775712678608402   0.435858588580919'''));
    inputB.add(parseVector('''0.446783749429806
   0.306349472016557
   0.508508655381127'''));
    expectedOutput.add(parseVector('''0.880847598834920
   0.495522709533064'''));
    */
    assert(inputA.length == inputB.length);
    assert(expectedOutput.length == inputB.length);

    for (int i = 0; i < inputA.length; i++) {
      dynamic output = inputA[i] * inputB[i];
      relativeTest(output, expectedOutput[i]);
    }
  }

  void testMatrixMultiplication() {
    List<dynamic> inputA = new List<dynamic>();
    List<dynamic> inputB = new List<dynamic>();
    List<dynamic> expectedOutput = new List<dynamic>();

    inputA.add(parseMatrix('''0.587044704531417   0.230488160211558   0.170708047147859   0.923379642103244
   0.207742292733028   0.844308792695389   0.227664297816554   0.430207391329584
   0.301246330279491   0.194764289567049   0.435698684103899   0.184816320124136
   0.470923348517591   0.225921780972399   0.311102286650413   0.904880968679893'''));
    inputB.add(parseMatrix('''0.979748378356085   0.408719846112552   0.711215780433683   0.318778301925882
   0.438869973126103   0.594896074008614   0.221746734017240   0.424166759713807
   0.111119223440599   0.262211747780845   0.117417650855806   0.507858284661118
   0.258064695912067   0.602843089382083   0.296675873218327   0.085515797090044'''));
    expectedOutput.add(parseMatrix('''0.933571062150012   0.978468014433530   0.762614053950618   0.450561572247979
   0.710396171182635   0.906228190244263   0.489336274658484   0.576762187862375
   0.476730868989407   0.464650419830879   0.363428748133464   0.415721232510293
   0.828623949506267   0.953951612073692   0.690010785130483   0.481326146122225'''));

    /*
    inputA.add(parseMatrix('''   0.510771564172110   0.644318130193692
   0.817627708322262   0.378609382660268
   0.794831416883453   0.811580458282477'''));
    inputB.add(parseMatrix('''0.532825588799455   0.939001561999887   0.550156342898422
   0.350727103576883   0.875942811492984   0.622475086001227'''));
    expectedOutput.add(parseMatrix('''0.498131991006930   1.044001131040501   0.682076199305903
   0.568441537273026   1.099393862354050   0.685497977895316
   0.708149781150244   1.457246010360863   0.942470161099672'''));
    */
    assert(inputA.length == inputB.length);
    assert(expectedOutput.length == inputB.length);

    for (int i = 0; i < inputA.length; i++) {
      dynamic output = inputA[i] * inputB[i];
      //print('${inputA[i].cols}x${inputA[i].rows} * ${inputB[i].cols}x${inputB[i].rows} = ${output.cols}x${output.rows}');
      relativeTest(output, expectedOutput[i]);
    }
  }

  void testAdjoint() {
    List<dynamic> input = new List<dynamic>();
    List<dynamic> expectedOutput = new List<dynamic>();

    input.add(parseMatrix(''' 0.285839018820374   0.380445846975357   0.053950118666607
   0.757200229110721   0.567821640725221   0.530797553008973
   0.753729094278495   0.075854289563064   0.779167230102011'''));
    expectedOutput.add(parseMatrix(''' 0.402164743710542  -0.292338588868304   0.171305679728352
  -0.189908046274114   0.182052622470548  -0.110871609529434
  -0.370546805539367   0.265070987960728  -0.125768101844091'''));
    input.add(parseMatrix('''0.830828627896291   0.549723608291140
   0.585264091152724   0.917193663829810'''));
    expectedOutput.add(parseMatrix('''   0.917193663829810  -0.549723608291140
  -0.585264091152724   0.830828627896291'''));
    input.add(parseMatrix('''0.934010684229183   0.011902069501241   0.311215042044805   0.262971284540144
   0.129906208473730   0.337122644398882   0.528533135506213   0.654079098476782
   0.568823660872193   0.162182308193243   0.165648729499781   0.689214503140008
   0.469390641058206   0.794284540683907   0.601981941401637   0.748151592823709'''));
    expectedOutput.add(parseMatrix('''0.104914550911225  -0.120218628213523   0.026180662741638   0.044107217835411
  -0.081375770192194  -0.233925009984709  -0.022194776259965   0.253560794325371
   0.155967414263983   0.300399085119975  -0.261648453454468  -0.076412061081351
  -0.104925204524921   0.082065846290507   0.217666653572481  -0.077704028180558'''));
    input.add(parseMatrix(''' 1     0
     0     1'''));
    expectedOutput.add(parseMatrix(''' 1     0
    0     1'''));
    input.add(parseMatrix('''1     0     0
     0     1     0
     0     0     1'''));
    expectedOutput.add(parseMatrix('''1     0     0
      0     1     0
      0     0     1'''));
    input.add(parseMatrix('''1     0     0     0
     0     1     0     0
     0     0     1     0
     0     0     0     1'''));
    expectedOutput.add(parseMatrix('''1     0     0     0
      0     1     0     0
      0     0     1     0
      0     0     0     1'''));

    input.add(parseMatrix('''0.450541598502498   0.152378018969223   0.078175528753184   0.004634224134067
   0.083821377996933   0.825816977489547   0.442678269775446   0.774910464711502
   0.228976968716819   0.538342435260057   0.106652770180584   0.817303220653433
   0.913337361501670   0.996134716626885   0.961898080855054   0.868694705363510'''));
    expectedOutput.add(parseMatrix('''-0.100386867815513   0.076681891597503  -0.049082198794982  -0.021689260610181
  -0.279454715225440  -0.269081505356250   0.114433412778961   0.133858687769130
   0.218879650360982   0.073892735462981   0.069073300555062  -0.132069899391626
   0.183633794399577   0.146113141160308  -0.156100829983306  -0.064859465665816'''));

    assert(input.length == expectedOutput.length);

    for (int i = 0; i < input.length; i++) {
      dynamic output = input[i].clone();
      output.scaleAdjoint(1.0);
      relativeTest(output, expectedOutput[i]);
    }
  }

  void testDeterminant() {
    List<dynamic> input = new List<dynamic>();
    List<double> expectedOutput = new List<double>();
    input.add(parseMatrix('''0.046171390631154   0.317099480060861   0.381558457093008   0.489764395788231
      0.097131781235848   0.950222048838355   0.765516788149002   0.445586200710899
      0.823457828327293   0.034446080502909   0.795199901137063   0.646313010111265
      0.694828622975817   0.438744359656398   0.186872604554379   0.709364830858073'''));
    expectedOutput.add(-0.199908980087990);

    input.add(parseMatrix('''  -2.336158020850647   0.358791716162913   0.571930324052307   0.866477090273158
  -1.190335868711951   1.132044609886021  -0.693048859451418   0.742195189800671
   0.015919048685702   0.552417702663606   1.020805610524362  -1.288062497216858
   3.020318574990609  -1.197139524685751  -0.400475005629390   0.441263145991252'''));
    expectedOutput.add(-5.002276533849802);

    input.add(parseMatrix('''0.830828627896291   0.549723608291140
   0.585264091152724   0.917193663829810'''));
    expectedOutput.add(0.440297265243183);

    input.add(parseMatrix('''0.285839018820374   0.380445846975357   0.053950118666607
   0.757200229110721   0.567821640725221   0.530797553008973
   0.753729094278495   0.075854289563064   0.779167230102011'''));
    expectedOutput.add(0.022713604103796);

    input.add(parseMatrix('''0.934010684229183   0.011902069501241   0.311215042044805   0.262971284540144
   0.129906208473730   0.337122644398882   0.528533135506213   0.654079098476782
   0.568823660872193   0.162182308193243   0.165648729499781   0.689214503140008
   0.469390641058206   0.794284540683907   0.601981941401637   0.748151592823709'''));
    expectedOutput.add(0.117969860982876);
    assert(input.length == expectedOutput.length);

    for (int i = 0; i < input.length; i++) {
      double output = input[i].determinant();
      //print('${input[i].cols}x${input[i].rows} = $output');
      relativeTest(output, expectedOutput[i]);
    }
  }

  void testSelfTransposeMultiply() {
    List<dynamic> inputA = new List<dynamic>();
    List<dynamic> inputB = new List<dynamic>();
    List<dynamic> expectedOutput = new List<dynamic>();

    inputA.add(parseMatrix('''0.450541598502498   0.152378018969223   0.078175528753184   0.004634224134067
   0.083821377996933   0.825816977489547   0.442678269775446   0.774910464711502
   0.228976968716819   0.538342435260057   0.106652770180584   0.817303220653433
   0.913337361501670   0.996134716626885   0.961898080855054   0.868694705363510'''));
    inputB.add(parseMatrix('''0.450541598502498   0.152378018969223   0.078175528753184   0.004634224134067
   0.083821377996933   0.825816977489547   0.442678269775446   0.774910464711502
   0.228976968716819   0.538342435260057   0.106652770180584   0.817303220653433
   0.913337361501670   0.996134716626885   0.961898080855054   0.868694705363510'''));
    expectedOutput.add(parseMatrix('''1.096629343508065   1.170948826011164   0.975285713492989   1.047596917860438
   1.170948826011164   1.987289692246011   1.393079247172284   1.945966332001094
   0.975285713492989   1.393079247172284   1.138698195167051   1.266161729169725
   1.047596917860438   1.945966332001094   1.266161729169725   2.023122749969790'''));

    inputA.add(parseMatrix('''0.084435845510910   0.800068480224308   0.181847028302852
   0.399782649098896   0.431413827463545   0.263802916521990
   0.259870402850654   0.910647594429523   0.145538980384717'''));
    inputB.add(parseMatrix('''0.136068558708664   0.549860201836332   0.622055131485066
   0.869292207640089   0.144954798223727   0.350952380892271
   0.579704587365570   0.853031117721894   0.513249539867053'''));
    expectedOutput.add(parseMatrix('''0.509665070066463   0.326055864494860   0.326206788210183
   1.011795431418814   1.279272055656899   1.116481872383158
   0.338435097301446   0.262379221330899   0.280398953455993'''));

    inputA.add(parseMatrix('''0.136068558708664   0.549860201836332   0.622055131485066
   0.869292207640089   0.144954798223727   0.350952380892271
   0.579704587365570   0.853031117721894   0.513249539867053'''));
    inputB.add(parseMatrix('''0.084435845510910   0.800068480224308   0.181847028302852
      0.399782649098896   0.431413827463545   0.263802916521990
      0.259870402850654   0.910647594429523   0.145538980384717'''));
    expectedOutput.add(parseMatrix('''0.509665070066463   1.011795431418814   0.338435097301446
   0.326055864494860   1.279272055656899   0.262379221330899
   0.326206788210183   1.116481872383158   0.280398953455993'''));
    assert(inputA.length == inputB.length);
    assert(inputB.length == expectedOutput.length);

    for (int i = 0; i < inputA.length; i++) {
      dynamic output = inputA[i].clone();
      output.transposeMultiply(inputB[i]);
      relativeTest(output, expectedOutput[i]);
    }
  }

  void testSelfMultiply() {
    List<dynamic> inputA = new List<dynamic>();
    List<dynamic> inputB = new List<dynamic>();
    List<dynamic> expectedOutput = new List<dynamic>();

    inputA.add(parseMatrix('''0.450541598502498   0.152378018969223   0.078175528753184   0.004634224134067
   0.083821377996933   0.825816977489547   0.442678269775446   0.774910464711502
   0.228976968716819   0.538342435260057   0.106652770180584   0.817303220653433
   0.913337361501670   0.996134716626885   0.961898080855054   0.868694705363510'''));
    inputB.add(parseMatrix('''0.450541598502498   0.152378018969223   0.078175528753184   0.004634224134067
   0.083821377996933   0.825816977489547   0.442678269775446   0.774910464711502
   0.228976968716819   0.538342435260057   0.106652770180584   0.817303220653433
   0.913337361501670   0.996134716626885   0.961898080855054   0.868694705363510'''));
    expectedOutput.add(parseMatrix('''0.237893273152584   0.241190507375353   0.115471053480014   0.188086069635435
   0.916103942227480   1.704973929800637   1.164721763902784   1.675285658272358
   0.919182849383279   1.351023203753565   1.053750106199745   1.215382950294249
   1.508657696357159   2.344965008135463   1.450552688877760   2.316940716769603'''));

    inputA.add(parseMatrix('''0.084435845510910   0.800068480224308   0.181847028302852
   0.399782649098896   0.431413827463545   0.263802916521990
   0.259870402850654   0.910647594429523   0.145538980384717'''));
    inputB.add(parseMatrix('''0.136068558708664   0.549860201836332   0.622055131485066
   0.869292207640089   0.144954798223727   0.350952380892271
   0.579704587365570   0.853031117721894   0.513249539867053'''));
    expectedOutput.add(parseMatrix('''0.812399915745417   0.317522849978516   0.426642592595554
   0.582350288210078   0.507392169174135   0.535489283769338
   0.911348663480233   0.399044409575883   0.555945473748377'''));

    inputA.add(parseMatrix('''0.136068558708664   0.549860201836332   0.622055131485066
   0.869292207640089   0.144954798223727   0.350952380892271
   0.579704587365570   0.853031117721894   0.513249539867053'''));
    inputB.add(parseMatrix('''0.084435845510910   0.800068480224308   0.181847028302852
      0.399782649098896   0.431413827463545   0.263802916521990
      0.259870402850654   0.910647594429523   0.145538980384717'''));
    expectedOutput.add(parseMatrix('''0.392967349540540   0.912554468305858   0.260331657549835
   0.222551972385485   1.077622741167203   0.247394954900102
   0.523353251675581   1.299202246456530   0.405147467960185'''));
    assert(inputA.length == inputB.length);
    assert(inputB.length == expectedOutput.length);

    for (int i = 0; i < inputA.length; i++) {
      dynamic output = inputA[i].clone();
      output.multiply(inputB[i]);
      relativeTest(output, expectedOutput[i]);
    }
  }

  void testSelfMultiplyTranspose() {
    List<dynamic> inputA = new List<dynamic>();
    List<dynamic> inputB = new List<dynamic>();
    List<dynamic> expectedOutput = new List<dynamic>();

    inputA.add(parseMatrix('''0.450541598502498   0.152378018969223   0.078175528753184   0.004634224134067
   0.083821377996933   0.825816977489547   0.442678269775446   0.774910464711502
   0.228976968716819   0.538342435260057   0.106652770180584   0.817303220653433
   0.913337361501670   0.996134716626885   0.961898080855054   0.868694705363510'''));
    inputB.add(parseMatrix('''0.450541598502498   0.152378018969223   0.078175528753184   0.004634224134067
   0.083821377996933   0.825816977489547   0.442678269775446   0.774910464711502
   0.228976968716819   0.538342435260057   0.106652770180584   0.817303220653433
   0.913337361501670   0.996134716626885   0.961898080855054   0.868694705363510'''));
    expectedOutput.add(parseMatrix('''0.232339681975335   0.201799089276976   0.197320406329789   0.642508126615338
   0.201799089276976   1.485449982570056   1.144315170085286   1.998154153033270
   0.197320406329789   1.144315170085286   1.021602397682138   1.557970885061235
   0.642508126615338   1.998154153033270   1.557970885061235   3.506347918663387'''));

    inputA.add(parseMatrix('''0.084435845510910   0.800068480224308   0.181847028302852
   0.399782649098896   0.431413827463545   0.263802916521990
   0.259870402850654   0.910647594429523   0.145538980384717'''));
    inputB.add(parseMatrix('''0.136068558708664   0.549860201836332   0.622055131485066
   0.869292207640089   0.144954798223727   0.350952380892271
   0.579704587365570   0.853031117721894   0.513249539867053'''));
    expectedOutput.add(parseMatrix('''0.564533756922142   0.253192835205285   0.824764060523193
   0.455715101026938   0.502645707562004   0.735161980594196
   0.626622330821134   0.408983306176468   1.002156614695209'''));

    inputA.add(parseMatrix('''0.136068558708664   0.549860201836332   0.622055131485066
   0.869292207640089   0.144954798223727   0.350952380892271
   0.579704587365570   0.853031117721894   0.513249539867053'''));
    inputB.add(parseMatrix('''0.084435845510910   0.800068480224308   0.181847028302852
      0.399782649098896   0.431413827463545   0.263802916521990
      0.259870402850654   0.910647594429523   0.145538980384717'''));
    expectedOutput.add(parseMatrix('''0.564533756922142   0.455715101026938   0.626622330821134
   0.253192835205285   0.502645707562004   0.408983306176468
   0.824764060523193   0.735161980594196   1.002156614695209'''));
    assert(inputA.length == inputB.length);
    assert(inputB.length == expectedOutput.length);

    for (int i = 0; i < inputA.length; i++) {
      dynamic output = inputA[i].clone();
      output.multiplyTranspose(inputB[i]);
      relativeTest(output, expectedOutput[i]);
    }
  }


  void testTranslationMatrix() {
    List<dynamic> inputA = new List<dynamic>();
    List<dynamic> inputB = new List<dynamic>();
    List<dynamic> output1 = new List<dynamic>();
    List<dynamic> output2 = new List<dynamic>();

    inputA.add(new mat4.identity());
    inputB.add(new mat4.translationRaw(1.0, 3.0, 5.7));
    output1.add(inputA[0] * inputB[0]);
    output2.add((new mat4.identity()).translate(1.0, 3.0, 5.7));

    assert(inputA.length == inputB.length);
    assert(output1.length == output2.length);

    for (int i = 0; i < inputA.length; i++) {
      relativeTest(output1[i], output2[i]);
    }
  }

  void testScaleMatrix() {
    List<dynamic> inputA = new List<dynamic>();
    List<dynamic> inputB = new List<dynamic>();
    List<dynamic> output1 = new List<dynamic>();
    List<dynamic> output2 = new List<dynamic>();

    inputA.add(new mat4.identity());
    inputB.add(new mat4.scaleRaw(1.0, 3.0, 5.7));
    output1.add(inputA[0] * inputB[0]);
    output2.add(new mat4.identity().scale(1.0, 3.0, 5.7));

    assert(inputA.length == inputB.length);
    assert(output1.length == output2.length);

    for (int i = 0; i < inputA.length; i++) {
      relativeTest(output1[i], output2[i]);
    }
  }

  void testRotateMatrix() {
    List<dynamic> output1 = new List<dynamic>();
    List<dynamic> output2 = new List<dynamic>();
    output1.add(new mat4.rotationX(1.57079632679));
    output2.add(new mat4.identity().rotateX(1.57079632679));
    output1.add(new mat4.rotationY(1.57079632679 * 0.5));
    output2.add(new mat4.identity().rotateY(1.57079632679 * 0.5));
    output1.add(new mat4.rotationZ(1.57079632679 * 0.25));
    output2.add(new mat4.identity().rotateZ(1.57079632679 * 0.25));
    {
      vec3 axis = new vec3.raw(1.1, 1.1, 1.1);
      axis.normalize();
      num angle = 1.5;

      quat q = new quat(axis, angle);
      mat3 R = q.asRotationMatrix();
      mat4 T = new mat4.identity();
      T.setRotation(R);
      output1.add(T);

      output2.add(new mat4.identity().rotate(axis, angle));
    }
    assert(output1.length == output2.length);
    for (int i = 0; i < output1.length; i++) {
      relativeTest(output1[i], output2[i]);
    }
    return;
  }

  void testMat2Transform() {
    mat2 rot = new mat2.rotation(Math.PI / 4);
    final vec2 input = new vec2.raw(0.234245234259, 0.890723489233);

    final vec2 expected = new vec2.raw(rot.col0.x * input.x + rot.col1.x * input.y,
                                       rot.col0.y * input.x + rot.col1.y * input.y);

    final vec2 transExpected = new vec2.raw(rot.col0.x * input.x + rot.col0.y * input.y,
                                            rot.col1.x * input.x + rot.col1.y * input.y);

    relativeTest(rot.transformed(input), expected);
    relativeTest(rot.transposed().transformed(input), transExpected);
  }

  void testMat3Transform() {
    mat3 rotX = new mat3.rotationX(Math.PI / 4);
    mat3 rotY = new mat3.rotationY(Math.PI / 4);
    mat3 rotZ = new mat3.rotationZ(Math.PI / 4);
    final vec3 input = new vec3.raw(1.0, 0.0, 0.0);

    relativeTest(rotX.transformed(input), input);
    relativeTest(rotY.transformed(input), new vec3.raw(1 / Math.sqrt(2), 0.0, 1.0 / Math.sqrt(2.0)));
    relativeTest(rotZ.transformed(input), new vec3.raw(1 / Math.sqrt(2), 1.0 / Math.sqrt(2.0), 0.0));
  }

  void test() {
    print('Running matrix tests');
    testMatrixTranspose();
    testDeterminant();
    testAdjoint();
    testSelfMultiply();
    testSelfTransposeMultiply();
    testSelfMultiplyTranspose();
    testMatrixMultiplication();
    testMatrixVectorMultiplication();
    testTranslationMatrix();
    testScaleMatrix();
    testRotateMatrix();
    testMat2Transform();
    testMat3Transform();
  }
}
