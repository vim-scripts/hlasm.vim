" Vim syntax file
" Language: High Level Assembler Language, HLASM, ASM370
" Maintainer:   Shen Bing
" Last Change:  August 23 2009

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif
syn case ignore


syn keyword xInstruction a ah al alr ap ar contained
syn keyword xInstruction bal balr bas basm bassm bc bcr bctr bsm bxh bxle contained
syn keyword xInstruction c cds ch cl clc clcl cli clm clr cp cr cs cvb cvd contained
syn keyword xInstruction d dp dr contained
syn keyword xInstruction ed edmk ex contained
syn keyword xInstruction ic icm ipm contained
syn keyword xInstruction l la lcr lh lm lnr lpr lr ltr contained
syn keyword xInstruction m mh mp mr mvc mvcin mvcl mvi mvn mvo mvz contained
syn keyword xInstruction n nc ni nr contained
syn keyword xInstruction o oc oi or contained
syn keyword xInstruction pack contained
syn keyword xInstruction s sh sl sla slda sldl sll slr sp sr sra srda srdl srl srp st stb stc contained
syn keyword xInstruction spm stcm sth stm svc contained
syn keyword xInstruction tm tr trt contained
syn keyword xInstruction unpk contained
syn keyword xInstruction x xc xi xr contained
syn keyword xInstruction zap contained

syn keyword xDirective amode com copy csect contained
syn keyword xDirective dc ds drop dsect contained
syn keyword xDirective eject end entry equ contained
syn keyword xDirective ltorg contained
syn keyword xDirective macro mend mexit mnote contained
syn keyword xDirective org print contained
syn keyword xDirective rmode space start title contained
syn keyword xDirective using contained

syn keyword xBranch b bct be ber bh bhr bl blr bm bmr bne bner bnh contained
syn keyword xBranch bnhr bnl bnlr bnm bnmr contained
syn keyword xBranch bno bnor bnp bnpr bnz bnzr bo bor bor bp bpr contained
syn keyword xBranch br bz bz bzr contained
syn keyword xBranch nop nopr contained

syn keyword xMacro actr ago aif anop chau close contained
syn keyword xMacro dcb contained
syn keyword xMacro gbla gblb gblc get contained
syn keyword xMacro lcla lclb lclc contained
syn keyword xMacro open contained
syn keyword xMacro ppio put contained
syn keyword xMacro read contained
syn keyword xMacro seta setb setc snap contained
syn keyword xMacro write wto wtor wtorpc contained

syn keyword xParameter blksize contained
syn keyword xParameter dcb ddname dsorg contained
syn keyword xParameter eodad gen contained
syn keyword xParameter id contained
syn keyword xParameter lrecl lv contained
syn keyword xParameter macrf contained
syn keyword xParameter nogen contained
syn keyword xParameter pdata contained
syn keyword xParameter recfm record ru contained
syn keyword xParameter storage contained


syn keyword xRegister   r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 contained
syn keyword xOperator   and eq ge gt le lt ne not or contained
syn match   xDelimiter  /[+\-,=.*/]/ contained
syn match   xAttribute  /[iklnst]'/ contained
syn match   xSymbol     /[&][0-9a-z@$#_]\+/ contained
syn match   xSymbol     /[.][0-9a-z@$#_]\+/ contained
syn match   xSymbol     /[a-z@#$][0-9a-z@$#_]\+/ contained
syn match   xSymbol1    /[&][0-9a-z@$#_]\+/ contained
syn match   xString     /[cbdxfhp]\(l[1-9][0-9]*\)\?'\([^']\|''\)*'/ contained contains=xSymbol1
syn match   xString     /[ ,]'\([^']\|''\)*'/ contained contains=xSymbol1
syn match   xString1    /'\([^']\|''\)*'/ contained contains=xSymbol1

syn match xLineComment  /^\(\*.*\|\.\*.*\)\%<73c/
syn match xContinue     /\%72c\S/
syn match xLabel        /^[@#$&.]\?[0-9a-z@$#_]\+/ skipwhite nextgroup=xOperation 
syn match xSpaceAndOp1  /^ \{1,14}/ skipwhite nextgroup=xOperation
syn match xOperation    /[0-9a-z@$#&_]\+/ contained contains=xInstruction,xDirective,xBranch,xMacro skipwhite  nextgroup=xOperand,xOperandStr
syn match xContinueLine /^ \{15}/ nextgroup=xOperand
syn match xOperand      /\((.*)\|[iklnst]'[0-9a-z@$#&_]\+\|[^iklnst ]'\([^']\|''\)*'\|[0-9a-z@$#&_]\+\|[+\-,=.*%!~;:?/]\+\)\+/ contained contains=xAttribute,xParameter,xRegister,xString,xOperator,xDelimiter,xSymbol skipwhite nextgroup=xComment
syn match xOperandStr   /'\([^']\|''\)*'\((.*)\)\?/ contained contains=xString1 skipwhite nextgroup=xComment
syn match xComment      /.*\%<73c/ contained
syn match xTodo         /.*:todo:.*/ 

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_asm_syntax_inits")
    if version < 508
        let did_asm_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif


    " The default methods for highlighting.  Can be overridden later
    HiLink xLineComment   Comment
    HiLink xComment       Comment
    HiLink xAttribute     Special
    HiLink xRegister      Type
    HiLink xContinue      Number
    HiLink xLabel         Identifier
    HiLink xSymbol        Identifier
    HiLink xSymbol1       Identifier
    HiLink xString        String
    HiLink xString1       String

    HiLink xInstruction   Statement
    HiLink xDirective     Special
    HiLink xBranch        Number
    HiLink xMacro         Macro
    HiLink xOperator      Operator
    HiLink xDelimiter     Operator

    HiLink xParameter     Keyword
    HiLink xTodo          Todo

    delcommand HiLink
endif


let b:current_syntax = "hlasm"
