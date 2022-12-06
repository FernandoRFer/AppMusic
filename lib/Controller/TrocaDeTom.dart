class TrocaDeTom {
  /*
  String T = "G";
  String I = "G";
  String IIb = "Ab";
  String II = "A";
  String IIx = "A#";
  String IIIb = "Bb";
  String III = "B";
  String IV = "C";
  String IVx = "C#";
  String Vb = "Db";
  String V = "D";
  String Vx = "D#";
  String VIb = "Eb";
  String VI = "E";
  String VIIb = "F";
  String VII = "F#";
  */

  String mudardetom(String cifra, String tom) {
    if (tom == 'C' || tom == "Am") {
      String novoTom = tom.replaceAll("C", "1I");

      String sub1 = cifra.replaceAll("Bbb", "7bb.");
      String sub2 = sub1.replaceAll("Cb", "1b.");
      String sub3 = sub2.replaceAll("C#", "1x.");
      String sub4 = sub3.replaceAll("D#", "2x.");
      String sub5 = sub4.replaceAll("Db", "2b.");
      String sub6 = sub5.replaceAll("Eb", "3b.");
      String sub7 = sub6.replaceAll("E#", "3x.");
      String sub8 = sub7.replaceAll("Fb", "4b.");
      String sub9 = sub8.replaceAll("F#", "4x.");
      String sub10 = sub9.replaceAll("Gb", "5b.");
      String sub11 = sub10.replaceAll("G#", "5x.");
      String sub12 = sub11.replaceAll("Ab", "6b.");
      String sub13 = sub12.replaceAll("A#", "6x.");
      String sub14 = sub13.replaceAll("Bb", "7b.");
      String sub15 = sub14.replaceAll("Bb", "7x.");
      String sub16 = sub15.replaceAll("C", "1.");
      String sub17 = sub16.replaceAll("D", "2.");
      String sub18 = sub17.replaceAll("E", "3.");
      String sub19 = sub18.replaceAll("F", "4.");
      String sub20 = sub19.replaceAll("G", "5.");
      String sub21 = sub20.replaceAll("A", "6.");
      String cifraFianl = sub21.replaceAll("B", "7.");

      return cifraFianl;
    }

    if (tom == 'Db' || tom == "Bm") {
      String novoTom = tom.replaceAll("Db", "1I");

      String subI = cifra.replaceAll("Db", "1I");
      String subIx = subI.replaceAll("D", "1Ix.");
      String subIIb = subIx.replaceAll("Ebb", "2IIb.");
      String subII = subIIb.replaceAll("Eb", "2II.");
      String subIIx = subII.replaceAll("E", "2IIx.");
      String subIIIb = subIIx.replaceAll("Fb", "3IIIb.");
      String subIII = subIIIb.replaceAll("F", "3III.");
      String subIV = subIII.replaceAll("Gb", "4IV.");
      String subIVx = subIV.replaceAll("G", "4IVx.");
      String subVb = subIVx.replaceAll("Abb", "5Vb.");
      String subV = subVb.replaceAll("Ab", "5V.");
      String subVx = subV.replaceAll("A", "5Vx.");
      String subVIb = subVx.replaceAll("Bbb", "6VIb.");
      String subVI = subVIb.replaceAll("Bb", "6VI.");
      String subVIx = subVI.replaceAll("Cb", "7VIIx.");
      String subVIIb = subVIx.replaceAll("Cb", "7VIIb.");
      String cifraFianl = subVIIb.replaceAll("C", "7VII.");
      return cifraFianl;
    }

    if (tom == 'D' || tom == "Bm") {
      String novoTom = tom.replaceAll("D", "1I");

      String subI = cifra.replaceAll("D", "1I");
      String subIx = subI.replaceAll("D#", "1Ix.");
      String subIIb = subIx.replaceAll("Eb", "2IIb.");
      String subII = subIIb.replaceAll("E", "2II.");
      String subIIx = subII.replaceAll("E#", "2IIx.");
      String subIIIb = subIIx.replaceAll("Fb", "3IIIb.");
      String subIII = subIIIb.replaceAll("F#", "3III.");
      String subIV = subIII.replaceAll("G", "4IV.");
      String subIVx = subIV.replaceAll("G#", "4IVx.");
      String subVb = subIVx.replaceAll("Ab", "5Vb.");
      String subV = subVb.replaceAll("A", "5V.");
      String subVx = subV.replaceAll("A#", "5Vx.");
      String subVIb = subVx.replaceAll("Bb", "6VIb.");
      String subVI = subVIb.replaceAll("B", "6VI.");
      String subVIx = subVI.replaceAll("Cb", "7VIIx.");
      String subVIIb = subVIx.replaceAll("C", "7VIIb.");
      String cifraFianl = subVIIb.replaceAll("C#", "7VII.");
      return cifraFianl;
    }

    if (tom == 'Eb' || tom == "Gm") {
      String novoTom = tom.replaceAll("Eb", "1I");

      String subI = cifra.replaceAll("Eb", "1I");
      String subIx = subI.replaceAll("E", "1Ix.");
      String subIIb = subIx.replaceAll("Fb", "2IIb.");
      String subII = subIIb.replaceAll("F", "2II.");
      String subIIx = subII.replaceAll("F#", "2IIx.");
      String subIIIb = subIIx.replaceAll("Gb", "3IIIb.");
      String subIII = subIIIb.replaceAll("G", "3III.");
      String subIV = subIII.replaceAll("Ab", "4IV.");
      String subIVx = subIV.replaceAll("A", "4IVx.");
      String subVb = subIVx.replaceAll("Bbb", "5Vb.");
      String subV = subVb.replaceAll("Bb", "5V.");
      String subVx = subV.replaceAll("B", "5Vx.");
      String subVIb = subVx.replaceAll("Cb", "6VIb.");
      String subVI = subVIb.replaceAll("C", "6VI.");
      String subVIx = subVI.replaceAll("C#", "7VIIx.");
      String subVIIb = subVIx.replaceAll("Db", "7VIIb.");
      String cifraFianl = subVIIb.replaceAll("D", "7VII.");
      return cifraFianl;
    }

    if (tom == 'E' || tom == "C#m") {
      String novoTom = tom.replaceAll("E", "1I");

      String subI = cifra.replaceAll("E", "1I");
      String subIx = subI.replaceAll("E#", "1Ix.");
      String subIIb = subIx.replaceAll("F", "2IIb.");
      String subII = subIIb.replaceAll("F#", "2II.");
      String subIIx = subII.replaceAll("Gb", "2IIx.");
      String subIIIb = subIIx.replaceAll("G", "3IIIb.");
      String subIII = subIIIb.replaceAll("G#", "3III.");
      String subIV = subIII.replaceAll("A", "4IV.");
      String subIVx = subIV.replaceAll("A#", "4IVx.");
      String subVb = subIVx.replaceAll("Bb", "5Vb.");
      String subV = subVb.replaceAll("B", "5V.");
      String subVx = subV.replaceAll("B#", "5Vx.");
      String subVIb = subVx.replaceAll("Cb", "6VIb.");
      String subVI = subVIb.replaceAll("C", "6VI.");
      String subVIx = subVI.replaceAll("C#", "7VIIx.");
      String subVIIb = subVIx.replaceAll("D", "7VIIb.");
      String cifraFianl = subVIIb.replaceAll("D#", "7VII.");
      return cifraFianl;
    }

    if (tom == 'F' || tom == "Dm") {
      String novoTom = tom.replaceAll("F", "1I");

      String subI = cifra.replaceAll("F", "1I");
      String subIx = subI.replaceAll("F#", "1Ix.");
      String subIIb = subIx.replaceAll("Gb", "2IIb.");
      String subII = subIIb.replaceAll("G", "2II.");
      String subIIx = subII.replaceAll("G#", "2IIx.");
      String subIIIb = subIIx.replaceAll("Ab", "3IIIb.");
      String subIII = subIIIb.replaceAll("A", "3III.");
      String subIV = subIII.replaceAll("Bb", "4IV.");
      String subIVx = subIV.replaceAll("B", "4IVx.");
      String subVb = subIVx.replaceAll("Cb", "5Vb.");
      String subV = subVb.replaceAll("C", "5V.");
      String subVx = subV.replaceAll("C#", "5Vx.");
      String subVIb = subVx.replaceAll("Db", "6VIb.");
      String subVI = subVIb.replaceAll("D", "6VI.");
      String subVIx = subVI.replaceAll("D#", "7VIIx.");
      String subVIIb = subVIx.replaceAll("Eb", "7VIIb.");
      String cifraFianl = subVIIb.replaceAll("E", "7VII.");
      return cifraFianl;
    }

    if (tom == 'G' || tom == "Em") {
      String subI = cifra.replaceAll("G", "1I");
      String subIx = subI.replaceAll("G#", "1Ix.");
      String subIIb = subIx.replaceAll("Ab", "2IIb.");
      String subII = subIIb.replaceAll("A", "2II.");
      String subIIx = subII.replaceAll("A#", "2IIx.");
      String subIIIb = subIIx.replaceAll("Bb", "3IIIb.");
      String subIII = subIIIb.replaceAll("B", "3III.");
      String subIV = subIII.replaceAll("C", "4IV.");
      String subIVx = subIV.replaceAll("C#", "4IVx.");
      String subVb = subIVx.replaceAll("Db", "5Vb.");
      String subV = subVb.replaceAll("D", "5V.");
      String subVx = subV.replaceAll("D#", "5Vx.");
      String subVIb = subVx.replaceAll("Eb", "6VIb.");
      String subVI = subVIb.replaceAll("E", "6VI.");
      String subVIx = subVI.replaceAll("E#", "6VIx.");
      String subVIIb = subVIx.replaceAll("F", "7VIIb.");
      String cifraFianl = subVIIb.replaceAll("F#", "7VII.");
      return cifraFianl;
    }

    if (tom == 'Ab' || tom == "Fm") {
      String novoTom = tom.replaceAll("Ab", "1I");

      String subI = cifra.replaceAll("Ab", "1I");
      String subIx = subI.replaceAll("A", "1Ix.");
      String subIIb = subIx.replaceAll("Bbb", "2IIb.");
      String subII = subIIb.replaceAll("Bb", "2II.");
      String subIIx = subII.replaceAll("B", "2IIx.");
      String subIIIb = subIIx.replaceAll("Cb", "3IIIb.");
      String subIII = subIIIb.replaceAll("C", "3III.");
      String subIV = subIII.replaceAll("Db", "4IV.");
      String subIVx = subIV.replaceAll("D", "4IVx.");
      String subVb = subIVx.replaceAll("Ebb", "5Vb.");
      String subV = subVb.replaceAll("Eb", "5V.");
      String subVx = subV.replaceAll("E", "5Vx.");
      String subVIb = subVx.replaceAll("Fb", "6VIb.");
      String subVI = subVIb.replaceAll("F", "6VI.");
      String subVIx = subVI.replaceAll("F#", "7VIIx.");
      String subVIIb = subVIx.replaceAll("Gb", "7VIIb.");
      String cifraFianl = subVIIb.replaceAll("G", "7VII.");
      return cifraFianl;
    }

    if (tom == 'A' || tom == 'F#m') {
      String subI = cifra.replaceAll(
        "A",
        "1I",
      );
      String subIx = subI.replaceAll("A#", "1Ix.");
      String subIIb = subIx.replaceAll("Bb", "2IIb.");
      String subII = subIIb.replaceAll("B", "2II.");
      String subIIx = subII.replaceAll("B#", "2IIx.");
      String subIIIb = subIIx.replaceAll("C", "3IIIb.");
      String subIII = subIIIb.replaceAll("C#", "3III.");
      String subIV = subIII.replaceAll("D", "4IV.");
      String subIVx = subIV.replaceAll("D#", "4IVx.");
      String subVb = subIVx.replaceAll("Eb", "5Vb.");
      String subV = subVb.replaceAll("E", "5V.");
      String subVx = subV.replaceAll("E#", "5Vx.");
      String subVIb = subVx.replaceAll("F", "6VIb.");
      String subVI = subVIb.replaceAll("F#", "6VI.");
      String subVIx = subVI.replaceAll("Gb", "7VIIx.");
      String subVIIb = subVIx.replaceAll("G", "7VIIb.");
      String cifraLa = subVIIb.replaceAll("G#", "7VII.");

      return cifraLa;
    }

    if (tom == 'Bb' || tom == "Gm") {
      String novoTom = tom.replaceAll("Bb", "1I");

      String subI = cifra.replaceAll("Bb", "1I");
      String subIx = subI.replaceAll("B", "1Ix.");
      String subIIb = subIx.replaceAll("Cb", "2IIb.");
      String subII = subIIb.replaceAll("C", "2II.");
      String subIIx = subII.replaceAll("C#", "2IIx.");
      String subIIIb = subIIx.replaceAll("Db", "3IIIb.");
      String subIII = subIIIb.replaceAll("D", "3III.");
      String subIV = subIII.replaceAll("Eb", "4IV.");
      String subIVx = subIV.replaceAll("E", "4IVx.");
      String subVb = subIVx.replaceAll("Fb", "5Vb.");
      String subV = subVb.replaceAll("F", "5V.");
      String subVx = subV.replaceAll("F#", "5Vx.");
      String subVIb = subVx.replaceAll("Gb", "6VIb.");
      String subVI = subVIb.replaceAll("G", "6VI.");
      String subVIx = subVI.replaceAll("G#", "7VIIx.");
      String subVIIb = subVIx.replaceAll("Ab", "7VIIb.");
      String cifraFianl = subVIIb.replaceAll("A", "7VII.");
      return cifraFianl;
    }

    if (tom == 'B' || tom == "G#m") {
      String novoTom = tom.replaceAll("B", "1I");

      String subI = cifra.replaceAll("B", "1I");
      String subIx = subI.replaceAll("B#", "1Ix.");
      String subIIb = subIx.replaceAll("C", "2IIb.");
      String subII = subIIb.replaceAll("C#", "2II.");
      String subIIx = subII.replaceAll("Db", "2IIx.");
      String subIIIb = subIIx.replaceAll("D", "3IIIb.");
      String subIII = subIIIb.replaceAll("D#", "3III.");
      String subIV = subIII.replaceAll("E", "4IV.");
      String subIVx = subIV.replaceAll("E#", "4IVx.");
      String subVb = subIVx.replaceAll("F", "5Vb.");
      String subV = subVb.replaceAll("F#", "5V.");
      String subVx = subV.replaceAll("G", "5Vx.");
      String subVIb = subVx.replaceAll("G", "6VIb.");
      String subVI = subVIb.replaceAll("G#", "6VI.");
      String subVIx = subVI.replaceAll("Ab", "7VIIx.");
      String subVIIb = subVIx.replaceAll("A", "7VIIb.");
      String cifraFianl = subVIIb.replaceAll("A#", "7VII.");

      return cifraFianl;
    }

    if (tom == 'F#' || tom == "D#m") {
      String novoTom = tom.replaceAll("F#", "1I");

      String subI = cifra.replaceAll("F#", "1I");
      String subIx = subI.replaceAll("G", "1Ix.");
      String subIIb = subIx.replaceAll("G", "2IIb.");
      String subII = subIIb.replaceAll("G#", "2II.");
      String subIIx = subII.replaceAll("Ab", "2IIx.");
      String subIIIb = subIIx.replaceAll("A", "3IIIb.");
      String subIII = subIIIb.replaceAll("A#", "3III.");
      String subIV = subIII.replaceAll("B", "4IV.");
      String subIVx = subIV.replaceAll("B#", "4IVx.");
      String subVb = subIVx.replaceAll("C", "5Vb.");
      String subV = subVb.replaceAll("C#", "5V.");
      String subVx = subV.replaceAll("D", "5Vx.");
      String subVIb = subVx.replaceAll("D", "6VIb.");
      String subVI = subVIb.replaceAll("D#", "6VI.");
      String subVIx = subVI.replaceAll("Eb", "7VIIx.");
      String subVIIb = subVIx.replaceAll("E", "7VIIb.");
      String cifraFianl = subVIIb.replaceAll("E#", "7VII.");

      return cifraFianl;
    }

    String erro = 'Erro';
    return erro;
  }

  String mudarParaDo(String cifra) {
    String subI = cifra.replaceAll("1.", "C");
    String subIx = subI.replaceAll("1x.", "C#");
    String subIIb = subIx.replaceAll("2b.", "Db");
    String subII = subIIb.replaceAll("2.", "D");
    String subIIx = subII.replaceAll("2x.", "D#");
    String subIIIb = subIIx.replaceAll("3b.", "Eb");
    String subIII = subIIIb.replaceAll("3.", "E");
    String subIV = subIII.replaceAll("4.", "F");
    String subIVx = subIV.replaceAll("4x.", "F#");
    String subVb = subIVx.replaceAll("5b.", "Gb");
    String subV = subVb.replaceAll("5.", "G");
    String subVx = subV.replaceAll("5x.", "G#");
    String subVIb = subVx.replaceAll("6b.", "Ab");
    String subVI = subVIb.replaceAll("6.", "A");
    String subVIx = subVI.replaceAll("6x.", "A#");
    String subVIIb = subVIx.replaceAll("7b.", "B");
    String cifraDo = subVIIb.replaceAll("7.", "B#");

    return cifraDo;
  }

  String mudarParaReBemol(String cifra) {
    String subI = cifra.replaceAll("1.", "Db");
    String subIx = subI.replaceAll("1x.", "D");
    String subIIb = subIx.replaceAll("2b.", "Ebb");
    String subII = subIIb.replaceAll("2.", "Eb");
    String subIIx = subII.replaceAll("2x.", "E");
    String subIIIb = subIIx.replaceAll("3b.", "Fb");
    String subIII = subIIIb.replaceAll("3.", "F");
    String subIV = subIII.replaceAll("4.", "Gb");
    String subIVx = subIV.replaceAll("4x.", "G");
    String subVb = subIVx.replaceAll("5b.", "Abb");
    String subV = subVb.replaceAll("5.", "Ab");
    String subVx = subV.replaceAll("5x.", "A");
    String subVIb = subVx.replaceAll("6b.", "Bbb");
    String subVI = subVIb.replaceAll("6.", "Bb");
    String subVIx = subVI.replaceAll("7bb.", "Cb");
    String subVIIb = subVIx.replaceAll("7b.", "Cb");
    String cifraFianl = subVIIb.replaceAll("7.", "C");
    return cifraFianl;
  }

  String mudarParaSol(String cifra) {
    String subI = cifra.replaceAll("1", "G");
    String subIx = subI.replaceAll("1x.", "G#");
    String subIIb = subIx.replaceAll("2b.", "Ab");
    String subII = subIIb.replaceAll("2.", "A");
    String subIIx = subII.replaceAll("2x.", "A#");
    String subIIIb = subIIx.replaceAll("3b.", "Bb");
    String subIII = subIIIb.replaceAll("3.", "B");
    String subIV = subIII.replaceAll("4.", "C");
    String subIVx = subIV.replaceAll("4x.", "C#");
    String subVb = subIVx.replaceAll("5Vb.", "Db");
    String subV = subVb.replaceAll("5.", "D");
    String subVx = subV.replaceAll("5x.", "D#");
    String subVIb = subVx.replaceAll("6b.", "Eb");
    String subVI = subVIb.replaceAll("6.", "E");
    String subVIx = subVI.replaceAll("6x.", "E#");
    String subVIIb = subVIx.replaceAll("7b.", "F");
    String cifraSol = subVIIb.replaceAll("7.", "F#");
    return cifraSol;
  }

  String mudarParaLa(String cifra) {
    String subI = cifra.replaceAll("1.", "A");
    String subIx = subI.replaceAll("1.", "A#");
    String subIIb = subIx.replaceAll("2b.", "Bb");
    String subII = subIIb.replaceAll("2.", "B");
    String subIIx = subII.replaceAll("2x.", "B#");
    String subIIIb = subIIx.replaceAll("3b.", "C");
    String subIII = subIIIb.replaceAll("3.", "C#");
    String subIV = subIII.replaceAll("4.", "D");
    String subIVx = subIV.replaceAll("4x.", "D#");
    String subVb = subIVx.replaceAll("5Vb.", "Eb");
    String subV = subVb.replaceAll("5.", "E");
    String subVx = subV.replaceAll("5.", "E#");
    String subVIb = subVx.replaceAll("6b.", "F");
    String subVI = subVIb.replaceAll("6.", "F#");
    String subVIx = subVI.replaceAll("6x.", "Fx");
    String subVIIb = subVIx.replaceAll("7b.", "G");
    String CifraLa = subVIIb.replaceAll("7.", "G#");
    return CifraLa;
  }

  String mudarParaRe(String cifra) {
    String subI = cifra.replaceAll("1I", "D");
    String subIx = subI.replaceAll("1Ix.", "D#");
    String subIIb = subIx.replaceAll("2IIb.", "Eb");
    String subII = subIIb.replaceAll("2II.", "E");
    String subIIx = subII.replaceAll("2IIx.", "E#");
    String subIIIb = subIIx.replaceAll("3IIIb.", "F");
    String subIII = subIIIb.replaceAll("3III.", "F#");
    String subIV = subIII.replaceAll("4IV.", "G");
    String subIVx = subIV.replaceAll("4IVx.", "G#");
    String subVb = subIVx.replaceAll("5Vb.", "Ab");
    String subV = subVb.replaceAll("5V.", "A");
    String subVx = subV.replaceAll("5Vx.", "A#");
    String subVIb = subVx.replaceAll("6VIb.", "Bb");
    String subVI = subVIb.replaceAll("6VI.", "B");
    String subVIx = subVI.replaceAll("6VIx.", "B#");
    String subVIIb = subVIx.replaceAll("7VIIb.", "C");
    String CifraSol = subVIIb.replaceAll("7VII.", "C#");
    return CifraSol;
  }

  Future<void> sol() async {
    String T = "G";
    String I = "G";
    String IIb = "Ab";
    String II = "A";
    String IIx = "A#";
    String IIIb = "Bb";
    String III = "B";
    String IV = "C";
    String IVx = "C#";
    String Vb = "Db";
    String V = "D";
    String Vx = "D#";
    String VIb = "Eb";
    String VI = "E";
    String VIIb = "F";
    String VII = "F#";
  }
}
