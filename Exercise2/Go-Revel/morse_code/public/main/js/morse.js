/**
 * Created by Carl Loiuse Isip 09/10/2014
 **/

var morse = morse || {
    translate_words_to_morse: function(s) {
        var data = [],
            str_split = s.trim().replace(/\s\s+/g, ' ').split('');

        for (var index in str_split) {
            var letter = str_split[index].toUpperCase();

            if (morse._lookup.hasOwnProperty(letter)) {
                data.push(morse._lookup[letter]);
            }
        }
        return data.join(' ').replace(/\s+/, ' ');
    },
    translate_morse_to_words: function(s) {
        var data = [],
            str_split = s.trim().replace(/\/\/+/g, ' / ').split(/\s+/);

        for (var index in str_split) {
            var code = str_split[index];

            if (morse._reverse_lookup.hasOwnProperty(code)) {
                data.push(morse._reverse_lookup[code]);
            }
        }
        return data.join('').replace(/\s+/, ' ');
    },
    translate: function(s) {
        if (/^[.-\s\/]+$/.test(s)) {
            return morse.translate_morse_to_words(s);
        } else {
            return morse.translate_words_to_morse(s);
        }
    },
    _lookup: {
        ' ': '/',
        '!': '-.-.--',
        "'": '.----.',
        '"': '.-..-.',
        '$': '...-..-',
        '&': '.-...',
        '(': '-.--.',
        ')': '-.--.-',
        '+': '.-.-.',
        ',': '--..--',
        '-': '-....-',
        '.': '.-.-.-',
        '/': '-..-.',
        '0': '-----',
        '1': '.----',
        '2': '..---',
        '3': '...--',
        '4': '....-',
        '5': '.....',
        '6': '-....',
        '7': '--...',
        '8': '---..',
        '9': '----.',
        ':': '---...',
        ';': '-.-.-.',
        '=': '-...-',
        '?': '..--..',
        '@': '.--.-.',
        'A': '.-',
        'B': '-...',
        'C': '-.-.',
        'D': '-..',
        'E': '.',
        'F': '..-.',
        'G': '--.',
        'H': '....',
        'I': '..',
        'J': '.---',
        'K': '-.-',
        'L': '.-..',
        'M': '--',
        'N': '-.',
        'O': '---',
        'P': '.--.',
        'Q': '--.-',
        'R': '.-.',
        'S': '...',
        'T': '-',
        'U': '..-',
        'V': '...-',
        'W': '.--',
        'X': '-..-',
        'Y': '-.--',
        'Z': '--..',
        '_': '..--.-'
    },
    init: function() {
        morse._reverse_lookup = {};
        for (var key in morse._lookup) {
            morse._reverse_lookup[morse._lookup[key]] = key;
        }
    }
}
morse.init()
