package input

import sdl "vendor:sdl3"
import coreflux "../../coreflux"


handleKey :: proc(input: ^InputState, key: ^sdl.KeyboardEvent) {
    ed := input.editor

    switch key.which {
    case sdl.K_BACKSPACE:
        handleBackspace(ed, key.keysym.mod)
    case sdl.K_RETURN:
        insertNewline(ed)
    case sdl.K_LEFT:
        moveCursorLeft(ed)
    case sdl.K_RIGHT:
        moveCursorRight(ed)
    case sdl.K_UP:
        moveCursorUp(ed)
    case sdl.K_DOWN:
        moveCursorDown(ed)
    default:
        handleDefaultKey(ed)
}
}
handleTextInput :: proc(input: ^InputState, text: ^sdl.TextInputEvent) {
    ed := input.editor
    insertText(ed, text.text)
}
