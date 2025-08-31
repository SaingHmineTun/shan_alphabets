class Alphabet {
  final String id;
  final String saying;

  Alphabet(this.id, this.saying);
}

class AlphabetService {
  static final List<Alphabet> _alphabets = [
    Alphabet("ka", "ၵဝႃႈၵႆႇ ၵွပ်ႈတႆႇမႆႉၼိူဝ်ၵွၼ်း"),
    Alphabet("kha", "ၶဝႃႈၶႆႇ မႄႈမၼ်းတႆႇမႃးငွမ်း"),
    Alphabet("nga", "ငဝႃးငူး လိူၼ်မႃးၸူးတူဝ်ၶဵတ်ႇ"),
    Alphabet("za", "ၸဝႃႈၸၢင်ႉ ပႆႇဢုင်ႉဢၢင်ႉၸွမ်းတၢင်း"),
    Alphabet("sa", "သဝႃႈသိူဝ် မီးယူႇၼိူဝ်လႃႇႁႃႉ"),
    Alphabet("nya", "ၺဝႃႈၺွင်ႇ မီးၽၢႆႇႁွင်ႇၵွင်းမူး"),
    Alphabet("ta", "တဝႃႈတဝ်ႇ တီႈယူႇၵဝ်ႇႁိမ်းၼွင်"),
    Alphabet("tha", "ထဝႃႈထႆ တမ်းယႆဝႆႉသၢမ်မၢၵ်ႈ"),
    Alphabet("na", "ၼဝႃႈၼူ မေႃးၸူၸူၸွမ်းၸွၵ်း"),
    Alphabet("pa", "ပဝႃးပႃ ဢွႆႇလုၺ်းႁႃၵိၼ်ယိူဝ်ႈ"),
    Alphabet("pha", "ၽဝႃႈၽိုင်ႈ ၽွမ်ႉလုပ်ႇယိုင်ႈႁဵတ်းႁူင်း"),
    Alphabet("fa", "ၾဝႃႈၾႃႉ ၼႆႉပဵၼ်ၾႃႉၵၢင်ႁၢဝ်"),
    Alphabet("ma", "မဝႃႈမႄႈ သွၼ်ယဵၼ်ငႄႈလုၵ်ႈလၢင်း"),
    Alphabet("ya", "ယဝႃႈယုင်း ၵင်ႈသုတ်းမုင်းၸင်ႇလွတ်ႈ"),
    Alphabet("ra", "ရဝႃႈရဵၼ်း ဢၢၼ်ႇသွၼ်ႁဵၼ်းတီႈပွင်ႇ"),
    Alphabet("la", "လဝႃႈလေႃႉ ႁေႃႈၵႂႃႇတေႃႉၶူဝ်းသူၼ်"),
    Alphabet("wa", "ဝဝႃႈဝူဝ်း တူဝ်တေႃႉၶူဝ်းၵႂႃႇၵၢတ်ႇ"),
    Alphabet("ha", "ႁဝႃႈႁိူဝ်း ဝၢႆႈလတ်းမိူဝ်းၶၢမ်ႈတႃႈ"),
    Alphabet("a", "ဢဝႃႈဢွႆႈ ၸဵမ်းၸွႆႈၸွႆႈၵိၼ်ဝၢၼ်"),
  ];

  static List<Alphabet> getAllAlphabets() => _alphabets;

  static int getCount() => _alphabets.length;

  static Alphabet getAlphabetByPrefixValue(String prefixValue) {
    return _alphabets.firstWhere(
      (alpha) => alpha.saying.startsWith(prefixValue),
    );
  }

  static int getIndexOfAlphabetUsingPrefixValue(String value) {
    var alphabet = getAlphabetByPrefixValue(value);
    return indexOfAlphabet(alphabet);
  }

  static int indexOfAlphabet(Alphabet alphabet) => _alphabets.indexOf(alphabet);
}
