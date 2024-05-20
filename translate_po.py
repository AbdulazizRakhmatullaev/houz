import os
from googletrans import Translator
from polib import pofile, POEntry

def translate_po_file(input_path, target_lang):
    translator = Translator()
    po = pofile(input_path)
    for entry in po:
        if not entry.msgstr:  # Only translate if msgstr is empty
            try:
                translated = translator.translate(entry.msgid, src='en', dest=target_lang)
                entry.msgstr = translated.text
            except Exception as e:
                print(f"Error translating '{entry.msgid}': {e}")
    po.save(input_path)  # Save directly to input file
    print(f"Translations saved to {input_path}")

def main():
    locale_dir = 'locale'
    languages = ['ru', 'uz']  # Add other languages as needed
    for lang in languages:
        input_file = os.path.join(locale_dir, lang, 'LC_MESSAGES', 'django.po')
        if os.path.exists(input_file):
            translate_po_file(input_file, lang)
        else:
            print(f"File {input_file} does not exist")

if __name__ == "__main__":
    main()
