" Vim Color Thingy

hi clear

set background=dark
if exists("syntax_on")
    syntax reset
endif
let colors_name = "carebear"

let g:cb = {}

" base color for all the things
let g:cb.default = [ 'd0d0d0', 15 ]

" constructors, common lib names
let g:cb.subtle = ['ffffff', 15 ]

let g:cb.red1 = ['ffffff', 52 ]

" function, braces, if, else
let g:cb.flow1 = [ 'ffffff', 26 ]
" for, while, do
let g:cb.flow2 = [ 'ffffff', 23 ]
" brackets
let g:cb.flow3 = [ '106bba', 139 ]
" parens
let g:cb.flow4 = [ 'c4bf81', 44 ]

let g:cb.blue1 = [ 'ffffff', 26 ]
let g:cb.blue2 = [ 'ffffff', 32 ]
let g:cb.blue3 = [ 'ffffff', 45 ]
let g:cb.blue4 = [ 'ffffff', 81 ]
let g:cb.blue5 = [ 'ffffff', 117 ]
let g:cb.blue6 = [ 'ffffff', 195] 

let g:cb.yellow1 = [ 'ffffff', 226 ]
let g:cb.yellow2 = [ 'ffffff', 227 ]
let g:cb.yellow3 = [ 'ffffff', 228 ]
let g:cb.yellow4 = [ 'ffffff', 229 ]
let g:cb.yellow5 = [ 'ffffff', 230 ]


let g:cb.green1 = [ 'ffffff', 47  ]
let g:cb.green2 = [ 'ffffff', 49 ]
let g:cb.green3 = [ 'ffffff', 86  ]

let g:cb.wat2 = ['ffffff', 141]
let g:cb.wat3 = ['ffffff', 90 ]
let g:cb.wat4 = ['ffffff', 237 ] 

" return, throw
let g:cb.notice1   = [ 'd1b231', 124 ]
" function arguments
let g:cb.notice2   = [ 'ba293b', 214 ]
" variable declarations, new,  delete 46
let g:cb.notice3   = [ 'C4BF81', 41 ]
" general identifiers/globals (this,arguments, let, const, private, window, alert)
let g:cb.notice4   = [ '5e8718', 63 ]
" scope-specific identifiers if avail (this, arguemnts )
let g:cb.notice5   = [ 'dddddd', 99 ]

" general builtins: numbers, true, false, undefined, null
let g:cb.common1   = [ 'ff9900', 202 ]
" truthy - numbers, true
let g:cb.common2   = [ 'ff9900', 202 ]
" falsy - null, undefined, false, 0
let g:cb.common3   = [ 'ff9900', 143 ]
" strings
let g:cb.common4    = ['ffff00', 137 ]

" logical operators
let g:cb.tissue1  = [ '452500', 127 ]
" arithmetic operators
let g:cb.tissue2 = [ 'ffffff', 139 ]
" property accessor, statement terminator, quotes
let g:cb.tissue3 = [ '888888', 244 ]





" dark blue
let g:cb.scenery2  = [ '051f33', 74 ]
" dark red
let g:cb.scenery3  = [ '391818', 221 ]
" dark green
let g:cb.scenery4  = [ '055f00', 22 ]
" gray normal
let g:cb.scenery5  = [ '777777', 127 ]


" regular text
let g:cb.baseNormal =         [ 'D8D8D8', 15]
" quoted strings, user input
let g:cb.baseConspicuous =    [ 'F3CE8B', 143 ]
" var, new, and other keywords
let g:cb.keywordNormal =      [ 'A7D936', 143 ]
" throw, return, delete
let g:cb.keywordConspicuous = [ 'FC2F50', 167 ]
" reserved variables, numbers, booleans
let g:cb.builtinNormal =      [ 'F7B954', 139 ]
" arguments, regex
let g:cb.builtinConspicuous = [ 'AB85FC', 110 ]
" arithmetic operators, brackets
let g:cb.operatorNormal =     [ '09E665', 9 ]
" conditional operators
let g:cb.operatorConspicuous = ['BF3BB6', 173 ]
" function, if, for, else, while, braces
let g:cb.controlNormal =      [ '117DBF', 110 ]
" parens, commas
let g:cb.controlConspicuous = [ 'ffffff', 148 ]
let g:cb.wat = ['ff9900', 202]

let g:cb.grayscale0 = ['ffffff', 15]
let g:cb.grayscale1 = ['d9cec3', 252]
let g:cb.grayscale2 = ['998f84', 245]
let g:cb.grayscale3 = ['857f78', 243]
let g:cb.grayscale4 = ['666462', 241]
let g:cb.grayscale5 = ['45413b', 238]
let g:cb.grayscale6 = ['35322d', 236]
let g:cb.grayscale7 = ['242321', 235]
let g:cb.grayscale8 = ['1c1b1a', 233]
let g:cb.grayscale9 = ['141413', 232]
let g:cb.grayscale10 = ['000000', 0]


" Highlighting Function 
" Original function by Steve Losh in his badwolf theme
" Available at http://stevelosh.com/projects/badwolf/
function! HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(g:cb, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(g:cb, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(g:cb, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction


" General/UI {{{

call HL('Normal', 'baseNormal', 'grayscale8')

call HL('Folded', 'grayscale4', 'bg', 'none')

call HL('VertSplit', 'grayscale2', 'bg', 'none')

call HL('CursorLine',   '', 'grayscale7', 'none')
call HL('CursorColumn', '', 'grayscale7')
call HL('ColorColumn',  '', 'grayscale7')

call HL('MatchParen', 'builtinNormal', 'grayscale7', 'bold')

call HL('NonText',    'grayscale5', 'bg')
call HL('SpecialKey', 'grayscale5', 'bg')

call HL('Visual',    '',  'grayscale5')
call HL('VisualNOS', '',  'grayscale5')

call HL('Search',    'grayscale10', 'builtinNormal', 'bold')
call HL('IncSearch', 'grayscale10', 'operatorConspicuous',    'bold')

call HL('Underlined', 'fg', '', 'underline')

call HL('StatusLine',   'grayscale10', 'operatorConspicuous',     'bold')
call HL('StatusLineNC', 'grayscale0', 'grayscale5', 'bold')

call HL('Directory', 'baseConspicuous', '', 'bold')

call HL('Title', 'keywordConspicuous')

call HL('ErrorMsg',   'keywordNormal',       'bg', 'bold')
call HL('MoreMsg',    'builtinNormal',   '',   'bold')
call HL('ModeMsg',    'baseConspicuous', '',   'bold')
call HL('Question',   'baseConspicuous', '',   'bold')
call HL('WarningMsg', 'keywordConspicuous',       '',   'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call HL('Tag', '', '', 'bold')

" hi IndentGuides                  guibg=#373737
" hi WildMenu        guifg=#66D9EF guibg=#000000

" }}}
" Gutter {{{

call HL('LineNr',     'grayscale4', 'grayscale6')
call HL('SignColumn', '',             'grayscale6')
call HL('FoldColumn', 'grayscale4', 'grayscale6')

" }}}
" Cursor {{{

call HL('Cursor',  'grayscale10', 'operatorConspicuous', 'bold')
call HL('vCursor', 'grayscale10', 'operatorConspicuous', 'bold')
call HL('iCursor', 'grayscale10', 'operatorConspicuous', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call HL('Special', 'baseNormal')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call HL('Comment',        'grayscale3')
call HL('Todo',           'grayscale0', 'bg', 'bold')
call HL('SpecialComment', 'grayscale0', 'bg', 'bold')

" Strings are a nice, pale straw color.  Nothing too fancy.
call HL('String', 'baseConspicuous')

" Control flow stuff is keywordNormal.
call HL('Statement',   'keywordNormal', '', 'bold')
call HL('Keyword',     'builtinNormal', '', 'bold')
call HL('Conditional', 'controlNormal', '', 'bold')
call HL('Operator',    'notice1', '', 'none')
call HL('Label',       'keywordConspicuous', '', 'none')
call HL('Repeat',      'keywordNormal', '', 'none')

" Functions and variable declarations are builtinConspicuous, because baseNormal looks weird.
call HL('Identifier', 'keywordNormal', '', 'none')
call HL('Function',   'controlNormal', '', 'none')

" Preprocessor stuff is keywordConspicuous, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call HL('PreProc',   'keywordConspicuous', '', 'none')
call HL('Macro',     'keywordConspicuous', '', 'none')
call HL('Define',    'keywordConspicuous', '', 'none')
call HL('PreCondit', 'keywordConspicuous', '', 'bold')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
call HL('Constant',  'builtinNormal', '', 'none')
call HL('Character', 'builtinNormal', '', 'none')
call HL('Boolean',   'builtinNormal', '', 'none')

call HL('Number', 'keywordConspicuous', '', 'none')
call HL('Float',  'keywordConspicuous', '', 'none')

" Not sure what 'special character in a constant' means, but let's make it pop.
call HL('SpecialChar', 'keywordConspicuous', '', 'bold')

call HL('Type', 'keywordConspicuous', '', 'none')
call HL('StorageClass', 'keywordNormal', '', 'none')
call HL('Structure', 'keywordNormal', '', 'none')
call HL('Typedef', 'keywordNormal', '', 'bold')

" Make try/catch blocks stand out.
call HL('Exception', 'keywordConspicuous', '', 'bold')

" Misc
call HL('Error',  'grayscale0',   'keywordNormal', 'bold')
call HL('Debug',  'grayscale0',   '',      'bold')
call HL('Ignore', 'grayscale3', '',      '')

" }}}
" Completion Menu {{{

call HL('Pmenu', 'baseNormal', 'grayscale6')
call HL('PmenuSel', 'grayscale10', 'operatorConspicuous', 'bold')
call HL('PmenuSbar', '', 'grayscale6')
call HL('PmenuThumb', 'grayscale1')

" }}}
" Diffs {{{

call HL('DiffDelete', 'grayscale10', 'grayscale10')
call HL('DiffAdd',    '',     'grayscale6')
call HL('DiffChange', '',     'grayscale7')
call HL('DiffText',   'grayscale0', 'grayscale6', 'bold')

" }}}
" Spelling {{{

if has("spell")
    call HL('SpellCap', 'builtinNormal', '', 'undercurl,bold', 'builtinNormal')
    call HL('SpellBad', '', '', 'undercurl', 'builtinNormal')
    call HL('SpellLocal', '', '', 'undercurl', 'builtinNormal')
    call HL('SpellRare', '', '', 'undercurl', 'builtinNormal')
endif

" }}}

" }}}
" Plugins {{{

" CtrlP {{{

    " the message when no match is found
    call HL('CtrlPNoEntries', 'grayscale0', 'keywordNormal', 'bold')

    " the matched pattern
    call HL('CtrlPMatch', 'builtinConspicuous', 'bg', 'none')

    " the line prefix '>' in the match window
    call HL('CtrlPLinePre', 'grayscale5', 'bg', 'none')

    " the prompt’s base
    call HL('CtrlPPrtBase', 'grayscale5', 'bg', 'none')

    " the prompt’s text
    call HL('CtrlPPrtText', 'baseNormal', 'bg', 'none')

    " the prompt’s cursor when moving over the text
    call HL('CtrlPPrtCursor', 'grayscale10', 'operatorConspicuous', 'bold')

    " 'prt' or 'win', also for 'regex'
    call HL('CtrlPMode1', 'grayscale10', 'operatorConspicuous', 'bold')

    " 'file' or 'path', also for the local working dir
    call HL('CtrlPMode2', 'grayscale10', 'operatorConspicuous', 'bold')

    " the scanning status
    call HL('CtrlPStats', 'grayscale10', 'operatorConspicuous', 'bold')

    " TODO: CtrlP extensions.
    " CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
    " CtrlPqfLineCol : the line and column numbers in quickfix mode (|hl-Search|)
    " CtrlPUndoT     : the elapsed time in undo mode (|hl-Directory|)
    " CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
    " CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call HL('EasyMotionTarget', 'operatorConspicuous',     'bg', 'bold')
call HL('EasyMotionShade',  'grayscale5', 'bg')

" }}}

" }}}
" Makegreen {{{

" hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=grayscale10 guibg=#9edf1c
" hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

" }}}
" ShowMarks {{{

call HL('ShowMarksHLl', 'operatorConspicuous', 'grayscale8')
call HL('ShowMarksHLu', 'operatorConspicuous', 'grayscale8')
call HL('ShowMarksHLo', 'operatorConspicuous', 'grayscale8')
call HL('ShowMarksHLm', 'operatorConspicuous', 'grayscale8')

" }}}

" }}}
" Filetype-specific {{{

" Clojure {{{

call HL('clojureSpecial',  'keywordNormal', '', '')
call HL('clojureDefn',     'keywordNormal', '', '')
call HL('clojureDefMacro', 'keywordNormal', '', '')
call HL('clojureDefine',   'keywordNormal', '', '')
call HL('clojureMacro',    'keywordNormal', '', '')
call HL('clojureCond',     'keywordNormal', '', '')

call HL('clojureKeyword', 'builtinConspicuous', '', 'none')

call HL('clojureFunc',   'keywordConspicuous', '', 'none')
call HL('clojureRepeat', 'keywordConspicuous', '', 'none')

call HL('clojureParen0', 'grayscale2', '', 'none')

call HL('clojureAnonArg', 'grayscale0', '', 'bold')

" }}}
" CSS {{{

call HL('cssColorProp', 'fg', '', 'none')
call HL('cssBoxProp', 'fg', '', 'none')
call HL('cssTextProp', 'fg', '', 'none')
call HL('cssRenderProp', 'fg', '', 'none')
call HL('cssGeneratedContentProp', 'fg', '', 'none')

call HL('cssValueLength', 'builtinNormal', '', 'bold')
call HL('cssColor', 'builtinNormal', '', 'bold')
call HL('cssBraces', 'grayscale2', '', 'none')
call HL('cssIdentifier', 'builtinConspicuous', '', 'bold')
call HL('cssClassName', 'builtinConspicuous', '', 'none')

" }}}
" Django Templates {{{

call HL('djangoArgument', 'baseConspicuous', '',)
call HL('djangoTagBlock', 'builtinConspicuous', '')
call HL('djangoVarBlock', 'builtinConspicuous', '')
" hi djangoStatement guifg=#ff3853 gui=bold
" hi djangoVarBlock guifg=#f4cf86

" }}}
" HTML {{{

" Punctuation
call HL('htmlTag',    'controlNormal', 'bg', 'none')
call HL('htmlEndTag', 'controlNormal', 'bg', 'none')

" Tag names
call HL('htmlTagName',        'operatorNormal', '', 'bold')
call HL('htmlSpecialTagName', 'operatorNormal', '', 'bold')

" Attributes
call HL('htmlArg', 'operatorNormal', '', 'none')

" Stuff inside an <a> tag
call HL('htmlLink', 'grayscale2', '', 'underline')

" }}}
" Java {{{

call HL('javaClassDecl', 'keywordNormal', '', 'bold')
call HL('javaScopeDecl', 'keywordNormal', '', 'bold')
call HL('javaCommentTitle', 'grayscale3', '')
call HL('javaDocTags', 'grayscale0', '', 'none')
call HL('javaDocParam', 'builtinNormal', '', '')

" }}}
" LessCSS {{{

call HL('lessVariable', 'keywordConspicuous', '', 'none')

" }}}
" Mail {{{

call HL('mailSubject', 'builtinConspicuous', '', 'bold')
call HL('mailHeader', 'grayscale2', '', '')
call HL('mailHeaderKey', 'grayscale2', '', '')
call HL('mailHeaderEmail', 'grayscale0', '', '')
call HL('mailURL', 'builtinNormal', '', 'underline')
call HL('mailSignature', 'grayscale3', '', 'none')

call HL('mailQuoted1', 'grayscale3', '', 'none')
call HL('mailQuoted2', 'keywordConspicuous', '', 'none')
call HL('mailQuoted3', 'baseConspicuous', '', 'none')
call HL('mailQuoted4', 'builtinConspicuous', '', 'none')
call HL('mailQuoted5', 'keywordConspicuous', '', 'none')

" }}}
" Markdown {{{

call HL('markdownHeadingRule', 'grayscale2', '', 'bold')
call HL('markdownHeadingDelimiter', 'grayscale2', '', 'bold')
call HL('markdownOrderedListMarker', 'grayscale2', '', 'bold')
call HL('markdownListMarker', 'grayscale2', '', 'bold')
call HL('markdownH1', 'builtinConspicuous', '', 'bold')
call HL('markdownH2', 'keywordConspicuous', '', 'bold')
call HL('markdownH3', 'keywordConspicuous', '', 'none')
call HL('markdownH4', 'keywordConspicuous', '', 'none')
call HL('markdownH5', 'keywordConspicuous', '', 'none')
call HL('markdownH6', 'keywordConspicuous', '', 'none')
call HL('markdownLinkText', 'builtinNormal', '', 'underline')
call HL('markdownIdDeclaration', 'builtinNormal')
call HL('markdownAutomaticLink', 'builtinNormal', '', 'bold')
call HL('markdownUrl', 'builtinNormal', '', 'bold')
call HL('markdownUrldelimiter', 'grayscale2', '', 'bold')
call HL('markdownLinkDelimiter', 'grayscale2', '', 'bold')
call HL('markdownLinkTextDelimiter', 'grayscale2', '', 'bold')
call HL('markdownCodeDelimiter', 'baseConspicuous', '', 'bold')
call HL('markdownCode', 'baseConspicuous', '', 'none')
call HL('markdownCodeBlock', 'baseConspicuous', '', 'none')

" }}}
" Python {{{

hi def link pythonOperator Operator
call HL('pythonBuiltin',    'keywordConspicuous')
call HL('pythonEscape',     'keywordConspicuous')
call HL('pythonException',  'keywordConspicuous', '', 'bold')
call HL('pythonExceptions', 'keywordConspicuous', '', 'none')
call HL('pythonDecorator',  'keywordNormal', '', 'none')

" }}}
" Vim {{{

call HL('VimCommentTitle', 'grayscale2', '', 'bold')

call HL('VimMapMod',    'keywordConspicuous', '', 'none')
call HL('VimMapModKey', 'keywordConspicuous', '', 'none')
call HL('VimNotation', 'keywordConspicuous', '', 'none')
call HL('VimBracket', 'keywordConspicuous', '', 'none')



call HL('javaScriptCommentTodo',      'grayscale2', '', 'none' )
call HL('javaScriptLineComment',      'grayscale5', '', 'none' )
call HL('javaScriptCommentSkip',      'grayscale4', '', 'none' )
call HL('javaScriptComment',	      'grayscale6', '', 'none' )
call HL('javaScriptSpecial',	      'wat', '', 'none' )
call HL('javaScriptStringD',	      'common4', '', 'none' )
call HL('javaScriptStringS',	      'common4', '', 'none' )

call HL('javaScriptSpecialCharacter', 'common1', '', 'bold' )
call HL('javaScriptNumber', 	      'blue3', '', 'none' )
call HL('javaScriptRegexpString',     'common4', '', 'none' )

call HL('javaScriptConditional',      'flow1', '', 'none' )
call HL('javaScriptRepeat', 	      'flow1', '', 'none' )
call HL('javaScriptBranch', 	      'flow2', '', 'none' )
call HL('javaScriptOperator', 	      'notice3', '', 'none' )
call HL('javaScriptType', 	      'notice4', '', 'none' )
call HL('javaScriptStatement', 	      'notice3', '', 'none' )
call HL('javaScriptBoolean', 	      'common1', '', 'none' )
call HL('javaScriptNull', 	      'yellow2', '', 'none' )
call HL('javaScriptIdentifier',       'notice3', '', 'none' )
call HL('javaScriptLabel', 	      'notice2', '', 'none' )
call HL('javaScriptException', 	      'flow1', '', 'none' )
call HL('javaScriptMessage', 	      'notice4', '', 'none' )
call HL('javaScriptGlobal', 	      'notice4', '', 'none' )
call HL('javaScriptMember',	      'notice4', '', 'none' )
call HL('javaScriptDeprecated',	      'notice4', '', 'none' )
call HL('javaScriptReserved',	      'notice4', '', 'none' )

call HL('javaScriptExit',             'notice1', '', 'none' )
call HL('javaScriptScopeIdentifier',  'blue5', '' )
call HL('javaScriptBrackets',         'flow3', '' )
call HL('javaScriptArguments',        'notice2', '' )
call HL('javaScriptPunctuation',      'flow3', '' )
call HL('javaScriptPropertyAccessor', 'flow3', '', 'bold' )
call HL('javaScriptGeneralOperator',   'blue2', '' )
call HL('javaScriptLogicalOperator',  'notice3', '' )
call HL('javaScriptComparitor',       'common3', '' )
call HL('javaScriptAssignment',       'notice3', '' )       

call HL('javaScriptObjectBrace', 'yellow3', '' )
call HL('javaScriptObjectLabel', 'green3', '')

call HL('javaScriptFunction',         'flow1' , '', 'bold')  
call HL('javaScriptBraces',           'flow1', '', 'none' )
call HL('javaScriptParens',           'blue5', '', 'none' )

