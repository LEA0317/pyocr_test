from PIL import Image
import sys
import os
import pyocr
import pyocr.builders

def ocr_reader(arg: str):
    tools = pyocr.get_available_tools()
    if len(tools) == 0:
        print("No OCR tool found")
        sys.exit(1)

    tool = tools[0]
    print("Will use tool '%s'" % (tool.get_name()))

    langs = tool.get_available_languages()
    print("Available languages: %s" % ", ".join(langs))

    txt = tool.image_to_string(
        Image.open(arg),
        lang='eng',
        builder=pyocr.builders.TextBuilder(tesseract_layout=6)
    )
    print(txt)

if __name__ == "__main__":
    args = sys.argv
    if len(args) <= 1:
        raise ValueError("not specified directory.")
    ocr_reader(args[1])
