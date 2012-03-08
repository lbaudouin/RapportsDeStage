
\ProvidesClass{RapportFR}[2011/10/05 V1.0 by Leo Baudouin]
\typeout{-- http://www.laas.fr/~leobaudo}
\NeedsTeXFormat{LaTeX2e}

\usepackage[utf8]{inputenc}
\usepackage[frenchb]{babel}
\usepackage{graphicx}
\usepackage{xspace}

\usepackage[official]{eurosym} %for currency


\def\RapportFRversionmajor{1}
\def\RapportFRversionminor{0}

% These do nothing, but provide them like in article.cls
\newif\if@restonecol
\newif\if@titlepage


% class option conditionals
\newif\ifCLASSOPTIONonecolumn       \CLASSOPTIONonecolumnfalse
\newif\ifCLASSOPTIONtwocolumn       \CLASSOPTIONtwocolumntrue

\newif\ifCLASSOPTIONoneside         \CLASSOPTIONonesidetrue
\newif\ifCLASSOPTIONtwoside         \CLASSOPTIONtwosidefalse

\newif\ifCLASSOPTIONfinal           \CLASSOPTIONfinaltrue
\newif\ifCLASSOPTIONdraft           \CLASSOPTIONdraftfalse
\newif\ifCLASSOPTIONdraftcls        \CLASSOPTIONdraftclsfalse
\newif\ifCLASSOPTIONdraftclsnofoot  \CLASSOPTIONdraftclsnofootfalse

\newif\ifCLASSOPTIONpeerreview      \CLASSOPTIONpeerreviewfalse
\newif\ifCLASSOPTIONpeerreviewca    \CLASSOPTIONpeerreviewcafalse

\newif\ifCLASSOPTIONjournal         \CLASSOPTIONjournaltrue
\newif\ifCLASSOPTIONconference      \CLASSOPTIONconferencefalse
\newif\ifCLASSOPTIONtechnote        \CLASSOPTIONtechnotefalse

\newif\ifCLASSOPTIONnofonttune      \CLASSOPTIONnofonttunefalse

\newif\ifCLASSOPTIONcaptionsoff     \CLASSOPTIONcaptionsofffalse

\newif\ifCLASSOPTIONcompsoc         \CLASSOPTIONcompsocfalse

\newif\ifCLASSOPTIONromanappendices \CLASSOPTIONromanappendicesfalse


% class info conditionals

% indicates if pdf (via pdflatex) output
\newif\ifCLASSINFOpdf               \CLASSINFOpdffalse


% V1.6b internal flag to show if using a4paper
\newif\if@RapportFRusingAfourpaper       \@RapportFRusingAfourpaperfalse



% RapportFRtran class scratch pad registers
% dimen
\newdimen\@RapportFRtrantmpdimenA
\newdimen\@RapportFRtrantmpdimenB
% count
\newcount\@RapportFRtrantmpcountA
\newcount\@RapportFRtrantmpcountB
% token list
\newtoks\@RapportFRtrantmptoksA

% we use \CLASSOPTIONpt so that we can ID the point size (even for 9pt docs)
% as well as LaTeX's \@ptsize to retain some compatability with some
% external packages
\def\@ptsize{0}
% LaTeX does not support 9pt, so we set \@ptsize to 0 - same as that of 10pt
\DeclareOption{9pt}{\def\CLASSOPTIONpt{9}\def\@ptsize{0}}
\DeclareOption{10pt}{\def\CLASSOPTIONpt{10}\def\@ptsize{0}}
\DeclareOption{11pt}{\def\CLASSOPTIONpt{11}\def\@ptsize{1}}
\DeclareOption{12pt}{\def\CLASSOPTIONpt{12}\def\@ptsize{2}}



\DeclareOption{letterpaper}{\setlength{\paperheight}{11in}%
                            \setlength{\paperwidth}{8.5in}%
                            \@RapportFRusingAfourpaperfalse
                            \def\CLASSOPTIONpaper{letter}%
                            \def\CLASSINFOpaperwidth{8.5in}%
                            \def\CLASSINFOpaperheight{11in}}


\DeclareOption{a4paper}{\setlength{\paperheight}{297mm}%
                        \setlength{\paperwidth}{210mm}%
                        \@RapportFRusingAfourpapertrue
                        \def\CLASSOPTIONpaper{a4}%
                        \def\CLASSINFOpaperwidth{210mm}%
                        \def\CLASSINFOpaperheight{297mm}}

\DeclareOption{oneside}{\@twosidefalse\@mparswitchfalse
                        \CLASSOPTIONonesidetrue\CLASSOPTIONtwosidefalse}
\DeclareOption{twoside}{\@twosidetrue\@mparswitchtrue
                        \CLASSOPTIONtwosidetrue\CLASSOPTIONonesidefalse}

\DeclareOption{onecolumn}{\CLASSOPTIONonecolumntrue\CLASSOPTIONtwocolumnfalse}
\DeclareOption{twocolumn}{\CLASSOPTIONtwocolumntrue\CLASSOPTIONonecolumnfalse}

% If the user selects draft, then this class AND any packages
% will go into draft mode.
\DeclareOption{draft}{\CLASSOPTIONdrafttrue\CLASSOPTIONdraftclstrue
                      \CLASSOPTIONdraftclsnofootfalse} 
% draftcls is for a draft mode which will not affect any packages
% used by the document.
\DeclareOption{draftcls}{\CLASSOPTIONdraftfalse\CLASSOPTIONdraftclstrue
                         \CLASSOPTIONdraftclsnofootfalse} 
% draftclsnofoot is like draftcls, but without the footer.
\DeclareOption{draftclsnofoot}{\CLASSOPTIONdraftfalse\CLASSOPTIONdraftclstrue
                               \CLASSOPTIONdraftclsnofoottrue} 
\DeclareOption{final}{\CLASSOPTIONdraftfalse\CLASSOPTIONdraftclsfalse
                      \CLASSOPTIONdraftclsnofootfalse}

\DeclareOption{journal}{\CLASSOPTIONpeerreviewfalse\CLASSOPTIONpeerreviewcafalse
                        \CLASSOPTIONjournaltrue\CLASSOPTIONconferencefalse\CLASSOPTIONtechnotefalse}

\DeclareOption{conference}{\CLASSOPTIONpeerreviewfalse\CLASSOPTIONpeerreviewcafalse
                           \CLASSOPTIONjournalfalse\CLASSOPTIONconferencetrue\CLASSOPTIONtechnotefalse}

\DeclareOption{technote}{\CLASSOPTIONpeerreviewfalse\CLASSOPTIONpeerreviewcafalse
                         \CLASSOPTIONjournalfalse\CLASSOPTIONconferencefalse\CLASSOPTIONtechnotetrue}

\DeclareOption{peerreview}{\CLASSOPTIONpeerreviewtrue\CLASSOPTIONpeerreviewcafalse
                           \CLASSOPTIONjournalfalse\CLASSOPTIONconferencefalse\CLASSOPTIONtechnotefalse}

\DeclareOption{peerreviewca}{\CLASSOPTIONpeerreviewtrue\CLASSOPTIONpeerreviewcatrue
                             \CLASSOPTIONjournalfalse\CLASSOPTIONconferencefalse\CLASSOPTIONtechnotefalse}

\DeclareOption{nofonttune}{\CLASSOPTIONnofonttunetrue}

\DeclareOption{captionsoff}{\CLASSOPTIONcaptionsofftrue}

\DeclareOption{compsoc}{\CLASSOPTIONcompsoctrue}

\DeclareOption{romanappendices}{\CLASSOPTIONromanappendicestrue}


% default to US letter paper, 10pt, twocolumn, one sided, final, journal
\ExecuteOptions{letterpaper,10pt,twocolumn,oneside,final,journal}
% overrride these defaults per user requests
\ProcessOptions



% Computer Society conditional execution command
\long\def\@RapportFRcompsoconly#1{\relax\ifCLASSOPTIONcompsoc\relax#1\relax\fi\relax}
% inverse
\long\def\@RapportFRnotcompsoconly#1{\relax\ifCLASSOPTIONcompsoc\else\relax#1\relax\fi\relax}
% compsoc conference
\long\def\@RapportFRcompsocconfonly#1{\relax\ifCLASSOPTIONcompsoc\ifCLASSOPTIONconference\relax#1\relax\fi\fi\relax}
% compsoc not conference
\long\def\@RapportFRcompsocnotconfonly#1{\relax\ifCLASSOPTIONcompsoc\ifCLASSOPTIONconference\else\relax#1\relax\fi\fi\relax}


% RapportFR uses Times Roman font, so we'll default to Times.
% These three commands make up the entire times.sty package.
\renewcommand{\sfdefault}{phv}
\renewcommand{\rmdefault}{ptm}
\renewcommand{\ttdefault}{pcr}

\@RapportFRcompsoconly{\typeout{-- Using RapportFR Computer Society mode.}}

% V1.7 compsoc nonconference papers, use Palatino/Palladio as the main text font,
% not Times Roman.
\@RapportFRcompsocnotconfonly{\renewcommand{\rmdefault}{ppl}}

% enable Times/Palatino main text font
\normalfont\selectfont





% V1.7 conference notice message hook
\def\@RapportFRconsolenoticeconference{\typeout{}%
\typeout{** Conference Paper **}%
\typeout{Before submitting the final camera ready copy, remember to:}%
\typeout{}%
\typeout{ 1. Manually equalize the lengths of two columns on the last page}%
\typeout{ of your paper;}%
\typeout{}%
\typeout{ 2. Ensure that any PostScript and/or PDF output post-processing}%
\typeout{ uses only Type 1 fonts and that every step in the generation}%
\typeout{ process uses the appropriate paper size.}%
\typeout{}}


% we can send console reminder messages to the user here
\AtEndDocument{\ifCLASSOPTIONconference\@RapportFRconsolenoticeconference\fi}


% warn about the use of single column other than for draft mode
\ifCLASSOPTIONtwocolumn\else%
  \ifCLASSOPTIONdraftcls\else%
   \typeout{** ATTENTION: Single column mode is not typically used with RapportFR publications.}%
  \fi%
\fi


% V1.7 improved paper size setting code.
% Set pdfpage and dvips paper sizes. Conditional tests are similar to that
% of ifpdf.sty. Retain within {} to ensure tested macros are never altered,
% even if only effect is to set them to \relax.
% if \pdfoutput is undefined or equal to relax, output a dvips special
{\@ifundefined{pdfoutput}{\AtBeginDvi{\special{papersize=\CLASSINFOpaperwidth,\CLASSINFOpaperheight}}}{%
% pdfoutput is defined and not equal to \relax
% check for pdfpageheight existence just in case someone sets pdfoutput
% under non-pdflatex. If exists, set them regardless of value of \pdfoutput.
\@ifundefined{pdfpageheight}{\relax}{\global\pdfpagewidth\paperwidth
\global\pdfpageheight\paperheight}%
% if using \pdfoutput=0 under pdflatex, send dvips papersize special
\ifcase\pdfoutput
\AtBeginDvi{\special{papersize=\CLASSINFOpaperwidth,\CLASSINFOpaperheight}}%
\else
% we are using pdf output, set CLASSINFOpdf flag
\global\CLASSINFOpdftrue
\fi}}

% let the user know the selected papersize
\typeout{-- Using \CLASSINFOpaperwidth\space x \CLASSINFOpaperheight\space
(\CLASSOPTIONpaper)\space paper.}

\ifCLASSINFOpdf
\typeout{-- Using PDF output.}
\else
\typeout{-- Using DVI output.}
\fi


% The idea hinted here is for LaTeX to generate markleft{} and markright{}
% automatically for you after you enter \author{}, \journal{},
% \journaldate{}, journalvol{}, \journalnum{}, etc.
% However, there may be some backward compatibility issues here as
% well as some special applications for RapportFRtran.cls and special issues
% that may require the flexible \markleft{}, \markright{} and/or \markboth{}.
% We'll leave this as an open future suggestion.
%\newcommand{\journal}[1]{\def\@journal{#1}}
%\def\@journal{}



% pointsize values
% used with ifx to determine the document's normal size
\def\@RapportFRptsizenine{9}
\def\@RapportFRptsizeten{10}
\def\@RapportFRptsizeeleven{11}
\def\@RapportFRptsizetwelve{12}



% FONT DEFINITIONS (No sizexx.clo file needed) 
% V1.6 revised font sizes, displayskip values and
%      revised normalsize baselineskip to reduce underfull vbox problems
%      on the 58pc = 696pt = 9.5in text height we want
%      normalsize     #lines/column  baselineskip (aka leading)
%             9pt     63             11.0476pt (truncated down)
%            10pt     58             12pt      (exact)
%            11pt     52             13.3846pt (truncated down)
%            12pt     50             13.92pt   (exact)
%

% we need to store the nominal baselineskip for the given font size
% in case baselinestretch ever changes.
% this is a dimen, so it will not hold stretch or shrink
\newdimen\@RapportFRnormalsizeunitybaselineskip
\@RapportFRnormalsizeunitybaselineskip\baselineskip

\ifx\CLASSOPTIONpt\@RapportFRptsizenine
\typeout{-- This is a 9 point document.}
\def\normalsize{\@setfontsize{\normalsize}{9}{11.0476pt}}%
\setlength{\@RapportFRnormalsizeunitybaselineskip}{11.0476pt}%
\normalsize
\abovedisplayskip 1.5ex plus3pt minus1pt%
\belowdisplayskip \abovedisplayskip%
\abovedisplayshortskip 0pt plus3pt%
\belowdisplayshortskip 1.5ex plus3pt minus1pt
\def\small{\@setfontsize{\small}{8.5}{10pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{8}{9pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{7}{8pt}}
\def\tiny{\@setfontsize{\tiny}{5}{6pt}}
% sublargesize is the same as large - 10pt
\def\sublargesize{\@setfontsize{\sublargesize}{10}{12pt}}
\def\large{\@setfontsize{\large}{10}{12pt}}
\def\Large{\@setfontsize{\Large}{12}{14pt}}
\def\LARGE{\@setfontsize{\LARGE}{14}{17pt}}
\def\huge{\@setfontsize{\huge}{17}{20pt}}
\def\Huge{\@setfontsize{\Huge}{20}{24pt}}
\fi


% Check if we have selected 10 points
\ifx\CLASSOPTIONpt\@RapportFRptsizeten
\typeout{-- This is a 10 point document.}
\def\normalsize{\@setfontsize{\normalsize}{10}{12.00pt}}%
\setlength{\@RapportFRnormalsizeunitybaselineskip}{12pt}%
\normalsize
\abovedisplayskip 1.5ex plus4pt minus2pt%
\belowdisplayskip \abovedisplayskip%
\abovedisplayshortskip 0pt plus4pt%
\belowdisplayshortskip 1.5ex plus4pt minus2pt
\def\small{\@setfontsize{\small}{9}{10pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{8}{9pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{7}{8pt}}
\def\tiny{\@setfontsize{\tiny}{5}{6pt}}
% sublargesize is a tad smaller than large - 11pt
\def\sublargesize{\@setfontsize{\sublargesize}{11}{13.4pt}}
\def\large{\@setfontsize{\large}{12}{14pt}}
\def\Large{\@setfontsize{\Large}{14}{17pt}}
\def\LARGE{\@setfontsize{\LARGE}{17}{20pt}}
\def\huge{\@setfontsize{\huge}{20}{24pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
\fi


% Check if we have selected 11 points
\ifx\CLASSOPTIONpt\@RapportFRptsizeeleven
\typeout{-- This is an 11 point document.}
\def\normalsize{\@setfontsize{\normalsize}{11}{13.3846pt}}%
\setlength{\@RapportFRnormalsizeunitybaselineskip}{13.3846pt}%
\normalsize
\abovedisplayskip 1.5ex plus5pt minus3pt%
\belowdisplayskip \abovedisplayskip%
\abovedisplayshortskip 0pt plus5pt%
\belowdisplayshortskip 1.5ex plus5pt minus3pt
\def\small{\@setfontsize{\small}{10}{12pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{9}{10.5pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{8}{9pt}}
\def\tiny{\@setfontsize{\tiny}{6}{7pt}}
% sublargesize is the same as large - 12pt
\def\sublargesize{\@setfontsize{\sublargesize}{12}{14pt}}
\def\large{\@setfontsize{\large}{12}{14pt}}
\def\Large{\@setfontsize{\Large}{14}{17pt}}
\def\LARGE{\@setfontsize{\LARGE}{17}{20pt}}
\def\huge{\@setfontsize{\huge}{20}{24pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
\fi


% Check if we have selected 12 points
\ifx\CLASSOPTIONpt\@RapportFRptsizetwelve
\typeout{-- This is a 12 point document.}
\def\normalsize{\@setfontsize{\normalsize}{12}{13.92pt}}%
\setlength{\@RapportFRnormalsizeunitybaselineskip}{13.92pt}%
\normalsize
\abovedisplayskip 1.5ex plus6pt minus4pt%
\belowdisplayskip \abovedisplayskip%
\abovedisplayshortskip 0pt plus6pt%
\belowdisplayshortskip 1.5ex plus6pt minus4pt
\def\small{\@setfontsize{\small}{10}{12pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{9}{10.5pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{8}{9pt}}
\def\tiny{\@setfontsize{\tiny}{6}{7pt}}
% sublargesize is the same as large - 14pt
\def\sublargesize{\@setfontsize{\sublargesize}{14}{17pt}}
\def\large{\@setfontsize{\large}{14}{17pt}}
\def\Large{\@setfontsize{\Large}{17}{20pt}}
\def\LARGE{\@setfontsize{\LARGE}{20}{24pt}}
\def\huge{\@setfontsize{\huge}{22}{26pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
\fi


% V1.6 The Computer Modern Fonts will issue a substitution warning for
% 24pt titles (24.88pt is used instead) increase the substitution
% tolerance to turn off this warning
\def\fontsubfuzz{.9pt}
% However, the default (and correct) Times font will scale exactly as needed.


% warn the user in case they forget to use the 9pt option with
% technote
\ifCLASSOPTIONtechnote%
 \ifx\CLASSOPTIONpt\@RapportFRptsizenine\else%
  \typeout{** ATTENTION: Technotes are normally 9pt documents.}%
 \fi%
\fi


% V1.7
% Improved \textunderscore to provide a much better fake _ when used with
% OT1 encoding. Under OT1, detect use of pcr or cmtt \ttfamily and use
% available true _ glyph for those two typewriter fonts.
\def\@RapportFRstringptm{ptm} % Times Roman family
\def\@RapportFRstringppl{ppl} % Palatino Roman family
\def\@RapportFRstringphv{phv} % Helvetica Sans Serif family
\def\@RapportFRstringpcr{pcr} % Courier typewriter family
\def\@RapportFRstringcmtt{cmtt} % Computer Modern typewriter family
\DeclareTextCommandDefault{\textunderscore}{\leavevmode
\ifx\f@family\@RapportFRstringpcr\string_\else
\ifx\f@family\@RapportFRstringcmtt\string_\else
\ifx\f@family\@RapportFRstringptm\kern 0em\vbox{\hrule\@width 0.5em\@height 0.5pt\kern -0.3ex}\else
\ifx\f@family\@RapportFRstringppl\kern 0em\vbox{\hrule\@width 0.5em\@height 0.5pt\kern -0.3ex}\else
\ifx\f@family\@RapportFRstringphv\kern -0.03em\vbox{\hrule\@width 0.62em\@height 0.52pt\kern -0.33ex}\kern -0.03em\else
\kern 0.09em\vbox{\hrule\@width 0.6em\@height 0.44pt\kern -0.63pt\kern -0.42ex}\kern 0.09em\fi\fi\fi\fi\fi\relax}




% set the default \baselinestretch
\def\baselinestretch{1}
\ifCLASSOPTIONdraftcls
  \def\baselinestretch{1.5}% default baselinestretch for draft modes
\fi 


% process CLASSINPUT baselinestretch
\ifx\CLASSINPUTbaselinestretch\@RapportFRundefined
\else
  \edef\baselinestretch{\CLASSINPUTbaselinestretch} % user CLASSINPUT override
  \typeout{** ATTENTION: Overriding \string\baselinestretch\space to
           \baselinestretch\space via \string\CLASSINPUT.}
\fi

\normalsize % make \baselinestretch take affect




% store the normalsize baselineskip
\newdimen\CLASSINFOnormalsizebaselineskip
\CLASSINFOnormalsizebaselineskip=\baselineskip\relax
% and the normalsize unity (baselinestretch=1) baselineskip
% we could save a register by giving the user access to
% \@RapportFRnormalsizeunitybaselineskip. However, let's protect
% its read only internal status
\newdimen\CLASSINFOnormalsizeunitybaselineskip
\CLASSINFOnormalsizeunitybaselineskip=\@RapportFRnormalsizeunitybaselineskip\relax
% store the nominal value of jot
\newdimen\RapportFRnormaljot
\RapportFRnormaljot=0.25\baselineskip\relax

% set \jot
\jot=\RapportFRnormaljot\relax




% V1.6, we are now going to fine tune the interword spacing
% The default interword glue for Times under TeX appears to use a
% nominal interword spacing of 25% (relative to the font size, i.e., 1em)
% a maximum of 40% and a minimum of 19%.
% For example, 10pt text uses an interword glue of:
% 
% 2.5pt plus 1.49998pt minus 0.59998pt
% 
% However, RapportFR allows for a more generous range which reduces the need
% for hyphenation, especially for two column text. Furthermore, RapportFR
% tends to use a little bit more nominal space between the words.
% RapportFR's interword spacing percentages appear to be:
% 35% nominal
% 23% minimum
% 50% maximum
% (They may even be using a tad more for the largest fonts such as 24pt.)
% 
% for bold text, RapportFR increases the spacing a little more:
% 37.5% nominal
% 23% minimum
% 55% maximum

% here are the interword spacing ratios we'll use
% for medium (normal weight)
\def\@RapportFRinterspaceratioM{0.35}
\def\@RapportFRinterspaceMINratioM{0.23}
\def\@RapportFRinterspaceMAXratioM{0.50}

% for bold
\def\@RapportFRinterspaceratioB{0.375}
\def\@RapportFRinterspaceMINratioB{0.23}
\def\@RapportFRinterspaceMAXratioB{0.55}


% command to revise the interword spacing for the current font under TeX:
% \fontdimen2 = nominal interword space
% \fontdimen3 = interword stretch
% \fontdimen4 = interword shrink
% since all changes to the \fontdimen are global, we can enclose these commands
% in braces to confine any font attribute or length changes
\def\@@@RapportFRsetfontdimens#1#2#3{{%
\setlength{\@RapportFRtrantmpdimenB}{\f@size pt}% grab the font size in pt, could use 1em instead.
\setlength{\@RapportFRtrantmpdimenA}{#1\@RapportFRtrantmpdimenB}%
\fontdimen2\font=\@RapportFRtrantmpdimenA\relax
\addtolength{\@RapportFRtrantmpdimenA}{-#2\@RapportFRtrantmpdimenB}%
\fontdimen3\font=-\@RapportFRtrantmpdimenA\relax
\setlength{\@RapportFRtrantmpdimenA}{#1\@RapportFRtrantmpdimenB}%
\addtolength{\@RapportFRtrantmpdimenA}{-#3\@RapportFRtrantmpdimenB}%
\fontdimen4\font=\@RapportFRtrantmpdimenA\relax}}

% revise the interword spacing for each font weight
\def\@@RapportFRsetfontdimens{{%
\mdseries
\@@@RapportFRsetfontdimens{\@RapportFRinterspaceratioM}{\@RapportFRinterspaceMAXratioM}{\@RapportFRinterspaceMINratioM}%
\bfseries
\@@@RapportFRsetfontdimens{\@RapportFRinterspaceratioB}{\@RapportFRinterspaceMAXratioB}{\@RapportFRinterspaceMINratioB}%
}}

% revise the interword spacing for each font shape
% \slshape is not often used for RapportFR work and is not altered here. The \scshape caps are
% already a tad too large in the free LaTeX fonts (as compared to what RapportFR uses) so we
% won't alter these either.
\def\@RapportFRsetfontdimens{{%
\normalfont
\@@RapportFRsetfontdimens
\normalfont\itshape
\@@RapportFRsetfontdimens
}}

% command to revise the interword spacing for each font size (and shape
% and weight). Only the \rmfamily is done here as \ttfamily uses a 
% fixed spacing and \sffamily is not used as the main text of RapportFR papers.
\def\@RapportFRtunefonts{{\selectfont\rmfamily
\tiny\@RapportFRsetfontdimens
\scriptsize\@RapportFRsetfontdimens
\footnotesize\@RapportFRsetfontdimens
\small\@RapportFRsetfontdimens
\normalsize\@RapportFRsetfontdimens
\sublargesize\@RapportFRsetfontdimens
\large\@RapportFRsetfontdimens
\LARGE\@RapportFRsetfontdimens
\huge\@RapportFRsetfontdimens
\Huge\@RapportFRsetfontdimens}}

% if the nofonttune class option is not given, revise the interword spacing
% now - in case RapportFRtran makes any default length measurements, and make
% sure all the default fonts are loaded
\ifCLASSOPTIONnofonttune\else
\@RapportFRtunefonts
\fi

% and again at the start of the document in case the user loaded different fonts
\AtBeginDocument{\ifCLASSOPTIONnofonttune\else\@RapportFRtunefonts\fi}



% V1.6 
% LaTeX is a little to quick to use hyphenations
% So, we increase the penalty for their use and raise
% the badness level that triggers an underfull hbox
% warning. The author may still have to tweak things,
% but the appearance will be much better "right out
% of the box" than that under V1.5 and prior.
% TeX default is 50
\hyphenpenalty=750
% If we didn't adjust the interword spacing, 2200 might be better.
% The TeX default is 1000
\hbadness=1350
% RapportFR does not use extra spacing after punctuation
\frenchspacing

% V1.7 increase this a tad to discourage equation breaks
\binoppenalty=1000 % default 700
\relpenalty=800     % default 500


% margin note stuff
\marginparsep      10pt
\marginparwidth    20pt
\marginparpush     25pt


% if things get too close, go ahead and let them touch
\lineskip            0pt
\normallineskip      0pt
\lineskiplimit       0pt
\normallineskiplimit 0pt

% The distance from the lower edge of the text body to the
% footline
\footskip 0.4in

% normally zero, should be relative to font height.
% put in a little rubber to help stop some bad breaks (underfull vboxes)
\parskip 0ex plus 0.2ex minus 0.1ex

\parindent    1.0em

\topmargin    -49.0pt
\headheight   12pt
\headsep      0.25in

% use the normal font baselineskip
% so that \topskip is unaffected by changes in \baselinestretch
\topskip=\@RapportFRnormalsizeunitybaselineskip
\textheight       58pc  % 9.63in, 696pt
% Tweak textheight to a perfect integer number of lines/page.
% The normal baselineskip for each document point size is used 
% to determine these values.
\ifx\CLASSOPTIONpt\@RapportFRptsizenine\textheight=63\@RapportFRnormalsizeunitybaselineskip\fi      % 63 lines/page
\ifx\CLASSOPTIONpt\@RapportFRptsizeten\textheight=58\@RapportFRnormalsizeunitybaselineskip\fi       % 58 lines/page
\ifx\CLASSOPTIONpt\@RapportFRptsizeeleven\textheight=52\@RapportFRnormalsizeunitybaselineskip\fi    % 52 lines/page
\ifx\CLASSOPTIONpt\@RapportFRptsizetwelve\textheight=50\@RapportFRnormalsizeunitybaselineskip\fi    % 50 lines/page


\columnsep         1pc
\textwidth        43pc   % 2 x 21pc + 1pc = 43pc
 

% the default side margins are equal
\if@RapportFRusingAfourpaper 
\oddsidemargin        14.32mm
\evensidemargin       14.32mm
\else
\oddsidemargin        0.680in
\evensidemargin       0.680in
\fi
% compensate for LaTeX's 1in offset
\addtolength{\oddsidemargin}{-1in}
\addtolength{\evensidemargin}{-1in}



% adjust margins for conference mode
\ifCLASSOPTIONconference
 \topmargin        -0.25in
 % we retain the reserved, but unused space for headers
 \addtolength{\topmargin}{-\headheight}
 \addtolength{\topmargin}{-\headsep}
 \textheight        9.25in % The standard for conferences (668.4975pt)
 % Tweak textheight to a perfect integer number of lines/page.
 \ifx\CLASSOPTIONpt\@RapportFRptsizenine\textheight=61\@RapportFRnormalsizeunitybaselineskip\fi      % 61 lines/page
 \ifx\CLASSOPTIONpt\@RapportFRptsizeten\textheight=56\@RapportFRnormalsizeunitybaselineskip\fi       % 56 lines/page
 \ifx\CLASSOPTIONpt\@RapportFRptsizeeleven\textheight=50\@RapportFRnormalsizeunitybaselineskip\fi    % 50 lines/page
 \ifx\CLASSOPTIONpt\@RapportFRptsizetwelve\textheight=48\@RapportFRnormalsizeunitybaselineskip\fi    % 48 lines/page
\fi


% compsoc conference
\ifCLASSOPTIONcompsoc
\ifCLASSOPTIONconference
 % compsoc conference use a larger value for columnsep
 \columnsep 0.375in
 % compsoc conferences want 1in top margin, 1.125in bottom margin
 \topmargin        0in
 \addtolength{\topmargin}{-6pt}% we tweak this a tad to better comply with top of line stuff
 % we retain the reserved, but unused space for headers
 \addtolength{\topmargin}{-\headheight}
 \addtolength{\topmargin}{-\headsep}
 \textheight        8.875in % (641.39625pt)
 % Tweak textheight to a perfect integer number of lines/page.
 \ifx\CLASSOPTIONpt\@RapportFRptsizenine\textheight=58\@RapportFRnormalsizeunitybaselineskip\fi      % 58 lines/page
 \ifx\CLASSOPTIONpt\@RapportFRptsizeten\textheight=53\@RapportFRnormalsizeunitybaselineskip\fi       % 53 lines/page
 \ifx\CLASSOPTIONpt\@RapportFRptsizeeleven\textheight=48\@RapportFRnormalsizeunitybaselineskip\fi    % 48 lines/page
 \ifx\CLASSOPTIONpt\@RapportFRptsizetwelve\textheight=46\@RapportFRnormalsizeunitybaselineskip\fi    % 46 lines/page 
 \textwidth 6.5in
 % the default side margins are equal
 \if@RapportFRusingAfourpaper 
  \oddsidemargin        22.45mm
  \evensidemargin       22.45mm
 \else
  \oddsidemargin        1in
  \evensidemargin       1in
 \fi
 % compensate for LaTeX's 1in offset
 \addtolength{\oddsidemargin}{-1in}
 \addtolength{\evensidemargin}{-1in}
\fi\fi



% draft mode settings override that of all other modes
% provides a nice 1in margin all around the paper and extra
% space between the lines for editor's comments
\ifCLASSOPTIONdraftcls 
  % want 1in from top of paper to text
  \setlength{\topmargin}{-\headsep}%
  \addtolength{\topmargin}{-\headheight}%
  % we want 1in side margins regardless of paper type
  \oddsidemargin      0in
  \evensidemargin     0in
  % set the text width
  \setlength{\textwidth}{\paperwidth}%
  \addtolength{\textwidth}{-2.0in}%
  \setlength{\textheight}{\paperheight}%
  \addtolength{\textheight}{-2.0in}%
  % digitize textheight to be an integer number of lines.
  % this may cause the bottom margin to be off a tad
  \addtolength{\textheight}{-1\topskip}%
  \divide\textheight  by \baselineskip%
  \multiply\textheight  by \baselineskip%
  \addtolength{\textheight}{\topskip}%
\fi



% process CLASSINPUT inner/outer margin
% if inner margin defined, but outer margin not, set outer to inner.
\ifx\CLASSINPUTinnersidemargin\@RapportFRundefined
\else
  \ifx\CLASSINPUToutersidemargin\@RapportFRundefined
    \edef\CLASSINPUToutersidemargin{\CLASSINPUTinnersidemargin}
  \fi
\fi

\ifx\CLASSINPUToutersidemargin\@RapportFRundefined
\else
  % if outer margin defined, but inner margin not, set inner to outer.
  \ifx\CLASSINPUTinnersidemargin\@RapportFRundefined
    \edef\CLASSINPUTinnersidemargin{\CLASSINPUToutersidemargin}
  \fi
  \setlength{\oddsidemargin}{\CLASSINPUTinnersidemargin}
  \ifCLASSOPTIONtwoside
    \setlength{\evensidemargin}{\CLASSINPUToutersidemargin}
  \else
    \setlength{\evensidemargin}{\CLASSINPUTinnersidemargin}
  \fi
  \addtolength{\oddsidemargin}{-1in}
  \addtolength{\evensidemargin}{-1in}
  \setlength{\textwidth}{\paperwidth}
  \addtolength{\textwidth}{-\CLASSINPUTinnersidemargin}
  \addtolength{\textwidth}{-\CLASSINPUToutersidemargin}
  \typeout{** ATTENTION: Overriding inner side margin to \CLASSINPUTinnersidemargin\space and 
           outer side margin to \CLASSINPUToutersidemargin\space via \string\CLASSINPUT.}
\fi



% process CLASSINPUT top/bottom text margin
% if toptext margin defined, but bottomtext margin not, set bottomtext to toptext margin
\ifx\CLASSINPUTtoptextmargin\@RapportFRundefined
\else
  \ifx\CLASSINPUTbottomtextmargin\@RapportFRundefined
    \edef\CLASSINPUTbottomtextmargin{\CLASSINPUTtoptextmargin}
  \fi
\fi

\ifx\CLASSINPUTbottomtextmargin\@RapportFRundefined
\else
  % if bottomtext margin defined, but toptext margin not, set toptext to bottomtext margin
  \ifx\CLASSINPUTtoptextmargin\@RapportFRundefined
    \edef\CLASSINPUTtoptextmargin{\CLASSINPUTbottomtextmargin}
  \fi
  \setlength{\topmargin}{\CLASSINPUTtoptextmargin}
  \addtolength{\topmargin}{-1in}
  \addtolength{\topmargin}{-\headheight}
  \addtolength{\topmargin}{-\headsep}
  \setlength{\textheight}{\paperheight}
  \addtolength{\textheight}{-\CLASSINPUTtoptextmargin}
  \addtolength{\textheight}{-\CLASSINPUTbottomtextmargin}
  % in the default format we use the normal baselineskip as topskip
  % we only need 0.7 of this to clear typical top text and we need
  % an extra 0.3 spacing at the bottom for descenders. This will
  % correct for both.
  \addtolength{\topmargin}{-0.3\@RapportFRnormalsizeunitybaselineskip}
  \typeout{** ATTENTION: Overriding top text margin to \CLASSINPUTtoptextmargin\space and 
           bottom text margin to \CLASSINPUTbottomtextmargin\space via \string\CLASSINPUT.}
\fi







% LIST SPACING CONTROLS

% Controls the amount of EXTRA spacing
% above and below \trivlist 
% Both \list and IED lists override this.
% However, \trivlist will use this as will most
% things built from \trivlist like the \center
% environment.
\topsep           0.5\baselineskip

% Controls the additional spacing around lists preceded
% or followed by blank lines. RapportFR does not increase
% spacing before or after paragraphs so it is set to zero.
% \z@ is the same as zero, but faster.
\partopsep          \z@

% Controls the spacing between paragraphs in lists. 
% RapportFR does not increase spacing before or after paragraphs
% so this is also zero. 
% With RapportFRtran.cls, global changes to
% this value DO affect lists (but not IED lists).
\parsep             \z@

% Controls the extra spacing between list items. 
% RapportFR does not put extra spacing between items.
% With RapportFRtran.cls, global changes to this value DO affect
% lists (but not IED lists).
\itemsep            \z@

% \itemindent is the amount to indent the FIRST line of a list
% item. It is auto set to zero within the \list environment. To alter
% it, you have to do so when you call the \list.
% However, RapportFR uses this for the theorem environment
% There is an alternative value for this near \leftmargini below
\itemindent         -1em

% \leftmargin, the spacing from the left margin of the main text to
% the left of the main body of a list item is set by \list.
% Hence this statement does nothing for lists.
% But, quote and verse do use it for indention.
\leftmargin         2em

% we retain this stuff from the older RapportFRtran.cls so that \list
% will work the same way as before. However, itemize, enumerate and
% description (IED) could care less about what these are as they
% all are overridden.
\leftmargini        2em
%\itemindent         2em  % Alternative values: sometimes used.
%\leftmargini        0em
\leftmarginii       1em
\leftmarginiii    1.5em
\leftmarginiv     1.5em
\leftmarginv      1.0em
\leftmarginvi     1.0em
\labelsep         0.5em 
\labelwidth         \z@


% The old RapportFRtran.cls behavior of \list is retained.
% However, the new V1.3 IED list environments override all the
% @list stuff (\@listX is called within \list for the
% appropriate level just before the user's list_decl is called). 
% \topsep is now 2pt as RapportFR puts a little extra space around
% lists - used by those non-IED macros that depend on \list.
% Note that \parsep and \itemsep are not redefined as in 
% the sizexx.clo \@listX (which article.cls uses) so global changes
% of these values DO affect \list
% 
\def\@listi{\leftmargin\leftmargini \topsep 2pt plus 1pt minus 1pt}
\let\@listI\@listi
\def\@listii{\leftmargin\leftmarginii\labelwidth\leftmarginii%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listiii{\leftmargin\leftmarginiii\labelwidth\leftmarginiii%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listiv{\leftmargin\leftmarginiv\labelwidth\leftmarginiv%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listv{\leftmargin\leftmarginv\labelwidth\leftmarginv%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listvi{\leftmargin\leftmarginvi\labelwidth\leftmarginvi%
    \advance\labelwidth-\labelsep \topsep 2pt}


% RapportFR uses 5) not 5.
\def\labelenumi{\theenumi)}     \def\theenumi{\arabic{enumi}}

% RapportFR uses a) not (a)
\def\labelenumii{\theenumii)}  \def\theenumii{\alph{enumii}}

% RapportFR uses iii) not iii.
\def\labelenumiii{\theenumiii)} \def\theenumiii{\roman{enumiii}}

% RapportFR uses A) not A.
\def\labelenumiv{\theenumiv)}   \def\theenumiv{\Alph{enumiv}}

% exactly the same as in article.cls
\def\p@enumii{\theenumi}
\def\p@enumiii{\theenumi(\theenumii)}
\def\p@enumiv{\p@enumiii\theenumiii}

% itemized list label styles
\def\labelitemi{$\scriptstyle\bullet$}
\def\labelitemii{\textbf{--}}
\def\labelitemiii{$\ast$}
\def\labelitemiv{$\cdot$}



% **** V1.3 ENHANCEMENTS ****
% Itemize, Enumerate and Description (IED) List Controls
% ***************************
% 
% 
% RapportFR seems to use at least two different values by
% which ITEMIZED list labels are indented to the right
% For The Journal of Lightwave Technology (JLT) and The Journal
% on Selected Areas in Communications (JSAC), they tend to use
% an indention equal to \parindent. For Transactions on Communications
% they tend to indent ITEMIZED lists a little more--- 1.3\parindent.
% We'll provide both values here for you so that you can choose 
% which one you like in your document using a command such as:
% setlength{\RapportFRilabelindent}{\RapportFRilabelindentB}
\newdimen\RapportFRilabelindentA
\RapportFRilabelindentA \parindent

\newdimen\RapportFRilabelindentB
\RapportFRilabelindentB 1.3\parindent
% However, we'll default to using \parindent
% which makes more sense to me
\newdimen\RapportFRilabelindent
\RapportFRilabelindent \RapportFRilabelindentA


% This controls the default amount the enumerated list labels
% are indented to the right.
% Normally, this is the same as the paragraph indention
\newdimen\RapportFRelabelindent
\RapportFRelabelindent \parindent

% This controls the default amount the description list labels
% are indented to the right.
% Normally, this is the same as the paragraph indention
\newdimen\RapportFRdlabelindent
\RapportFRdlabelindent \parindent

% This is the value actually used within the IED lists.
% The IED environments automatically set its value to
% one of the three values above, so global changes do 
% not have any effect
\newdimen\RapportFRlabelindent
\RapportFRlabelindent \parindent

% The actual amount labels will be indented is
% \RapportFRlabelindent multiplied by the factor below
% corresponding to the level of nesting depth
% This provides a means by which the user can
% alter the effective \RapportFRlabelindent for deeper
% levels
% There may not be such a thing as correct "standard RapportFR"
% values. What RapportFR actually does may depend on the specific
% circumstances.
% The first list level almost always has full indention.
% The second levels I've seen have only 75% of the normal indentation
% Three level or greater nestings are very rare. I am guessing
% that they don't use any indentation.
\def\RapportFRlabelindentfactori{1.0}   % almost always one
\def\RapportFRlabelindentfactorii{0.75} % 0.0 or 1.0 may be used in some cases
\def\RapportFRlabelindentfactoriii{0.0} % 0.75? 0.5? 0.0?
\def\RapportFRlabelindentfactoriv{0.0}
\def\RapportFRlabelindentfactorv{0.0}
\def\RapportFRlabelindentfactorvi{0.0}

% value actually used within IED lists, it is auto
% set to one of the 6 values above
% global changes here have no effect
\def\RapportFRlabelindentfactor{1.0}

% This controls the default spacing between the end of the IED
% list labels and the list text, when normal text is used for
% the labels.
\newdimen\RapportFRiednormlabelsep
\RapportFRiednormlabelsep 0.6em

% This controls the default spacing between the end of the IED
% list labels and the list text, when math symbols are used for
% the labels (nomenclature lists). RapportFR usually increases the 
% spacing in these cases
\newdimen\RapportFRiedmathlabelsep
\RapportFRiedmathlabelsep 1.2em

% This controls the extra vertical separation put above and
% below each IED list. RapportFR usually puts a little extra spacing
% around each list. However, this spacing is barely noticeable.
\newskip\RapportFRiedtopsep
\RapportFRiedtopsep 2pt plus 1pt minus 1pt


% This command is executed within each IED list environment
% at the beginning of the list. You can use this to set the 
% parameters for some/all your IED list(s) without disturbing 
% global parameters that affect things other than lists.
% i.e., renewcommand{\RapportFRiedlistdecl}{\setlength{\labelsep}{5em}}
% will alter the \labelsep for the next list(s) until 
% \RapportFRiedlistdecl is redefined. 
\def\RapportFRiedlistdecl{\relax}

% This command provides an easy way to set \leftmargin based
% on the \labelwidth, \labelsep and the argument \RapportFRlabelindent
% Usage: \RapportFRcalcleftmargin{width-to-indent-the-label}
% output is in the \leftmargin variable, i.e., effectively:
% \leftmargin = argument + \labelwidth + \labelsep
% Note controlled spacing here, shield end of lines with %
\def\RapportFRcalcleftmargin#1{\setlength{\leftmargin}{#1}%
\addtolength{\leftmargin}{\labelwidth}%
\addtolength{\leftmargin}{\labelsep}}

% This command provides an easy way to set \labelwidth to the
% width of the given text. It is the same as
% \settowidth{\labelwidth}{label-text}
% and useful as a shorter alternative.
% Typically used to set \labelwidth to be the width
% of the longest label in the list
\def\RapportFRsetlabelwidth#1{\settowidth{\labelwidth}{#1}}

% When this command is executed, IED lists will use the 
% RapportFRiedmathlabelsep label separation rather than the normal
% spacing. To have an effect, this command must be executed via
% the \RapportFRiedlistdecl or within the option of the IED list
% environments.
\def\RapportFRusemathlabelsep{\setlength{\labelsep}{\RapportFRiedmathlabelsep}}

% A flag which controls whether the IED lists automatically
% calculate \leftmargin from \RapportFRlabelindent, \labelwidth and \labelsep
% Useful if you want to specify your own \leftmargin
% This flag must be set (\RapportFRnocalcleftmargintrue or \RapportFRnocalcleftmarginfalse) 
% via the \RapportFRiedlistdecl or within the option of the IED list
% environments to have an effect.
\newif\ifRapportFRnocalcleftmargin
\RapportFRnocalcleftmarginfalse

% A flag which controls whether \RapportFRlabelindent is multiplied by
% the \RapportFRlabelindentfactor for each list level.
% This flag must be set via the \RapportFRiedlistdecl or within the option 
% of the IED list environments to have an effect.
\newif\ifRapportFRnolabelindentfactor
\RapportFRnolabelindentfactorfalse


% internal variable to indicate type of IED label
% justification
% 0 - left; 1 - center; 2 - right
\def\@RapportFRiedjustify{0}


% commands to allow the user to control IED
% label justifications. Use these commands within
% the IED environment option or in the \RapportFRiedlistdecl
% Note that changing the normal list justifications
% is nonstandard and RapportFR may not like it if you do so!
% I include these commands as they may be helpful to
% those who are using these enhanced list controls for
% other non-RapportFR related LaTeX work.
% itemize and enumerate automatically default to right
% justification, description defaults to left.
\def\RapportFRiedlabeljustifyl{\def\@RapportFRiedjustify{0}}%left
\def\RapportFRiedlabeljustifyc{\def\@RapportFRiedjustify{1}}%center
\def\RapportFRiedlabeljustifyr{\def\@RapportFRiedjustify{2}}%right




% commands to save to and restore from the list parameter copies
% this allows us to set all the list parameters within
% the list_decl and prevent \list (and its \@list) 
% from overriding any of our parameters
% V1.6 use \edefs instead of dimen's to conserve dimen registers
% Note controlled spacing here, shield end of lines with %
\def\@RapportFRsavelistparams{\edef\@RapportFRiedtopsep{\the\topsep}%
\edef\@RapportFRiedlabelwidth{\the\labelwidth}%
\edef\@RapportFRiedlabelsep{\the\labelsep}%
\edef\@RapportFRiedleftmargin{\the\leftmargin}%
\edef\@RapportFRiedpartopsep{\the\partopsep}%
\edef\@RapportFRiedparsep{\the\parsep}%
\edef\@RapportFRieditemsep{\the\itemsep}%
\edef\@RapportFRiedrightmargin{\the\rightmargin}%
\edef\@RapportFRiedlistparindent{\the\listparindent}%
\edef\@RapportFRieditemindent{\the\itemindent}}

% Note controlled spacing here
\def\@RapportFRrestorelistparams{\topsep\@RapportFRiedtopsep\relax%
\labelwidth\@RapportFRiedlabelwidth\relax%
\labelsep\@RapportFRiedlabelsep\relax%
\leftmargin\@RapportFRiedleftmargin\relax%
\partopsep\@RapportFRiedpartopsep\relax%
\parsep\@RapportFRiedparsep\relax%
\itemsep\@RapportFRieditemsep\relax%
\rightmargin\@RapportFRiedrightmargin\relax%
\listparindent\@RapportFRiedlistparindent\relax%
\itemindent\@RapportFRieditemindent\relax}


% v1.6b provide original LaTeX IED list environments
% note that latex.ltx defines \itemize and \enumerate, but not \description
% which must be created by the base classes
% save original LaTeX itemize and enumerate
\let\LaTeXitemize\itemize
\let\endLaTeXitemize\enditemize
\let\LaTeXenumerate\enumerate
\let\endLaTeXenumerate\endenumerate

% provide original LaTeX description environment from article.cls
\newenvironment{LaTeXdescription}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                 \normalfont\bfseries #1}


% override LaTeX's default IED lists
\def\itemize{\@RapportFRitemize}
\def\enditemize{\@endRapportFRitemize}
\def\enumerate{\@RapportFRenumerate}
\def\endenumerate{\@endRapportFRenumerate}
\def\description{\@RapportFRdescription}
\def\enddescription{\@endRapportFRdescription}

% provide the user with aliases - may help those using packages that
% override itemize, enumerate, or description
\def\RapportFRitemize{\@RapportFRitemize}
\def\endRapportFRitemize{\@endRapportFRitemize}
\def\RapportFRenumerate{\@RapportFRenumerate}
\def\endRapportFRenumerate{\@endRapportFRenumerate}
\def\RapportFRdescription{\@RapportFRdescription}
\def\endRapportFRdescription{\@endRapportFRdescription}


% V1.6 we want to keep the RapportFRtran IED list definitions as our own internal
% commands so they are protected against redefinition
\def\@RapportFRitemize{\@ifnextchar[{\@@RapportFRitemize}{\@@RapportFRitemize[\relax]}}
\def\@RapportFRenumerate{\@ifnextchar[{\@@RapportFRenumerate}{\@@RapportFRenumerate[\relax]}}
\def\@RapportFRdescription{\@ifnextchar[{\@@RapportFRdescription}{\@@RapportFRdescription[\relax]}}
\def\@endRapportFRitemize{\endlist}
\def\@endRapportFRenumerate{\endlist}
\def\@endRapportFRdescription{\endlist}


% DO NOT ALLOW BLANK LINES TO BE IN THESE IED ENVIRONMENTS
% AS THIS WILL FORCE NEW PARAGRAPHS AFTER THE IED LISTS
% RapportFRtran itemized list MDS 1/2001
% Note controlled spacing here, shield end of lines with %
\def\@@RapportFRitemize[#1]{%
                \ifnum\@itemdepth>3\relax\@toodeep\else%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                \advance\@itemdepth\@ne%
                \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
                % get the labelindentfactor for this level
                \advance\@listdepth\@ne% we need to know what the level WILL be
                \edef\RapportFRlabelindentfactor{\csname RapportFRlabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne% undo our increment
                \def\@RapportFRiedjustify{2}% right justified labels are default
                % set other defaults
                \RapportFRnocalcleftmarginfalse%
                \RapportFRnolabelindentfactorfalse%
                \topsep\RapportFRiedtopsep%
                \RapportFRlabelindent\RapportFRilabelindent%
                \labelsep\RapportFRiednormlabelsep%
                \partopsep 0ex%
                \parsep 0ex%
                \itemsep 0ex%
                \rightmargin 0em%
                \listparindent 0em%
                \itemindent 0em%
                % calculate the label width
                % the user can override this later if
                % they specified a \labelwidth
                \settowidth{\labelwidth}{\csname labelitem\romannumeral\the\@itemdepth\endcsname}%
                \@RapportFRsavelistparams% save our list parameters
                \list{\csname\@itemitem\endcsname}{%
                \@RapportFRrestorelistparams% override any list{} changes
                                       % to our globals
                \let\makelabel\@RapportFRiedmakelabel% v1.6b setup \makelabel
                \RapportFRiedlistdecl% let user alter parameters
                #1\relax%
                % If the user has requested not to use the
                % labelindent factor, don't revise \labelindent
                \ifRapportFRnolabelindentfactor\relax%
                \else\RapportFRlabelindent=\RapportFRlabelindentfactor\labelindent%
                \fi%
                % Unless the user has requested otherwise,
                % calculate our left margin based
                % on \RapportFRlabelindent, \labelwidth and
                % \labelsep
                \ifRapportFRnocalcleftmargin\relax%
                \else\RapportFRcalcleftmargin{\RapportFRlabelindent}%
                \fi}\fi\fi}%


% DO NOT ALLOW BLANK LINES TO BE IN THESE IED ENVIRONMENTS
% AS THIS WILL FORCE NEW PARAGRAPHS AFTER THE IED LISTS
% RapportFRtran enumerate list MDS 1/2001
% Note controlled spacing here, shield end of lines with %
\def\@@RapportFRenumerate[#1]{%
                \ifnum\@enumdepth>3\relax\@toodeep\else%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                \advance\@enumdepth\@ne%
                \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
                % get the labelindentfactor for this level
                \advance\@listdepth\@ne% we need to know what the level WILL be
                \edef\RapportFRlabelindentfactor{\csname RapportFRlabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne% undo our increment
                \def\@RapportFRiedjustify{2}% right justified labels are default
                % set other defaults
                \RapportFRnocalcleftmarginfalse%
                \RapportFRnolabelindentfactorfalse%
                \topsep\RapportFRiedtopsep%
                \RapportFRlabelindent\RapportFRelabelindent%
                \labelsep\RapportFRiednormlabelsep%
                \partopsep 0ex%
                \parsep 0ex%
                \itemsep 0ex%
                \rightmargin 0em%
                \listparindent 0em%
                \itemindent 0em%
                % calculate the label width
                % We'll set it to the width suitable for all labels using
                % normalfont 1) to 9)
                % The user can override this later
                \settowidth{\labelwidth}{9)}%
                \@RapportFRsavelistparams% save our list parameters
                \list{\csname label\@enumctr\endcsname}{\usecounter{\@enumctr}%
                \@RapportFRrestorelistparams% override any list{} changes
                                       % to our globals
                \let\makelabel\@RapportFRiedmakelabel% v1.6b setup \makelabel
                \RapportFRiedlistdecl% let user alter parameters 
                #1\relax%
                % If the user has requested not to use the
                % RapportFRlabelindent factor, don't revise \RapportFRlabelindent
                \ifRapportFRnolabelindentfactor\relax%
                \else\RapportFRlabelindent=\RapportFRlabelindentfactor\RapportFRlabelindent%
                \fi%
                % Unless the user has requested otherwise,
                % calculate our left margin based
                % on \RapportFRlabelindent, \labelwidth and
                % \labelsep
                \ifRapportFRnocalcleftmargin\relax%
                \else\RapportFRcalcleftmargin{\RapportFRlabelindent}%
                \fi}\fi\fi}%


% DO NOT ALLOW BLANK LINES TO BE IN THESE IED ENVIRONMENTS
% AS THIS WILL FORCE NEW PARAGRAPHS AFTER THE IED LISTS
% RapportFRtran description list MDS 1/2001
% Note controlled spacing here, shield end of lines with %
\def\@@RapportFRdescription[#1]{%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                % get the labelindentfactor for this level
                \advance\@listdepth\@ne% we need to know what the level WILL be
                \edef\RapportFRlabelindentfactor{\csname RapportFRlabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne% undo our increment
                \def\@RapportFRiedjustify{0}% left justified labels are default
                % set other defaults
                \RapportFRnocalcleftmarginfalse%
                \RapportFRnolabelindentfactorfalse%
                \topsep\RapportFRiedtopsep% 
                \RapportFRlabelindent\RapportFRdlabelindent%
                % assume normal labelsep
                \labelsep\RapportFRiednormlabelsep%
                \partopsep 0ex%
                \parsep 0ex%
                \itemsep 0ex%
                \rightmargin 0em%
                \listparindent 0em%
                \itemindent 0em%
                % Bogus label width in case the user forgets
                % to set it.
                % TIP: If you want to see what a variable's width is you
                % can use the TeX command \showthe\width-variable to 
                % display it on the screen during compilation 
                % (This might be helpful to know when you need to find out
                % which label is the widest)
                \settowidth{\labelwidth}{Hello}%
                \@RapportFRsavelistparams% save our list parameters
                \list{}{\@RapportFRrestorelistparams% override any list{} changes
                                               % to our globals
                \let\makelabel\@RapportFRiedmakelabel% v1.6b setup \makelabel
                \RapportFRiedlistdecl% let user alter parameters 
                #1\relax%
                % If the user has requested not to use the
                % labelindent factor, don't revise \RapportFRlabelindent
                \ifRapportFRnolabelindentfactor\relax%
                \else\RapportFRlabelindent=\RapportFRlabelindentfactor\RapportFRlabelindent%
                \fi%
                % Unless the user has requested otherwise,
                % calculate our left margin based
                % on \RapportFRlabelindent, \labelwidth and
                % \labelsep
                \ifRapportFRnocalcleftmargin\relax%
                \else\RapportFRcalcleftmargin{\RapportFRlabelindent}\relax%
                \fi}\fi}

% v1.6b we use one makelabel that does justification as needed.
\def\@RapportFRiedmakelabel#1{\relax\if\@RapportFRiedjustify 0\relax
\makebox[\labelwidth][l]{\normalfont #1}\else
\if\@RapportFRiedjustify 1\relax
\makebox[\labelwidth][c]{\normalfont #1}\else
\makebox[\labelwidth][r]{\normalfont #1}\fi\fi}


% VERSE and QUOTE
% V1.7 define environments with newenvironment
\newenvironment{verse}{\let\\=\@centercr
    \list{}{\itemsep\z@ \itemindent -1.5em \listparindent \itemindent
    \rightmargin\leftmargin\advance\leftmargin 1.5em}\item\relax}
    {\endlist}
\newenvironment{quotation}{\list{}{\listparindent 1.5em \itemindent\listparindent
    \rightmargin\leftmargin \parsep 0pt plus 1pt}\item\relax}
    {\endlist}
\newenvironment{quote}{\list{}{\rightmargin\leftmargin}\item\relax}
    {\endlist}


% \titlepage
% provided only for backward compatibility. \maketitle is the correct
% way to create the title page. 
\newif\if@restonecol
\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \else \newpage \fi \thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

% standard values from article.cls
\arraycolsep     5pt
\arrayrulewidth .4pt
\doublerulesep   2pt

\tabcolsep       6pt
\tabbingsep      0.5em


%% FOOTNOTES
%
%\skip\footins 10pt plus 4pt minus 2pt
% V1.6 respond to changes in font size
% space added above the footnotes (if present)
\skip\footins 0.9\baselineskip  plus 0.4\baselineskip  minus 0.2\baselineskip

% V1.6, we need to make \footnotesep responsive to changes
% in \baselineskip or strange spacings will result when in
% draft mode. Here is a little LaTeX secret - \footnotesep
% determines the height of an invisible strut that is placed
% *above* the baseline of footnotes after the first. Since
% LaTeX considers the space for characters to be 0.7/baselineskip
% above the baseline and 0.3/baselineskip below it, we need to
% use 0.7/baselineskip as a \footnotesep to maintain equal spacing
% between all the lines of the footnotes. RapportFR often uses a tad
% more, so use 0.8\baselineskip. This slightly larger value also helps
% the text to clear the footnote marks. Note that \thanks in RapportFRtran
% uses its own value of \footnotesep which is set in \maketitle.
{\footnotesize
\global\footnotesep 0.8\baselineskip}


\skip\@mpfootins = \skip\footins
\fboxsep = 3pt
\fboxrule = .4pt
% V1.6 use 1em, then use LaTeX2e's \@makefnmark
% Note that RapportFR normally *left* aligns the footnote marks, so we don't need
% box resizing tricks here.
\long\def\@makefntext#1{\parindent 1em\indent\hbox{\@makefnmark}#1}% V1.6 use 1em
% V1.7 compsoc does not use superscipts for footnote marks
\ifCLASSOPTIONcompsoc
\def\@RapportFRcompsocmakefnmark{\hbox{\normalfont\@thefnmark.\ }}
\long\def\@makefntext#1{\parindent 1em\indent\hbox{\@RapportFRcompsocmakefnmark}#1}
\fi

% RapportFR does not use footnote rules
\def\footnoterule{}

% V1.7 for compsoc, RapportFR uses a footnote rule only for \thanks. We devise a "one-shot"
% system to implement this.
\newif\if@RapportFRenableoneshotfootnoterule
\@RapportFRenableoneshotfootnoterulefalse
\ifCLASSOPTIONcompsoc
\def\footnoterule{\relax\if@RapportFRenableoneshotfootnoterule
\kern-5pt
\hbox to \columnwidth{\hfill\vrule width 0.5\columnwidth height 0.4pt\hfill}
\kern4.6pt
\global\@RapportFRenableoneshotfootnoterulefalse
\else
\relax
\fi}
\fi

% V1.6 do not allow LaTeX to break a footnote across multiple pages
\interfootnotelinepenalty=10000

% V1.6 discourage breaks within equations
% Note that amsmath normally sets this to 10000,
% but LaTeX2e normally uses 100.
\interdisplaylinepenalty=2500

% default allows section depth up to /paragraph
\setcounter{secnumdepth}{4}

% technotes do not allow /paragraph
\ifCLASSOPTIONtechnote
   \setcounter{secnumdepth}{3}
\fi
% neither do compsoc conferences
\@RapportFRcompsocconfonly{\setcounter{secnumdepth}{3}}


\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]

% used only by RapportFRtran's RapportFReqnarray as other packages may
% have their own, different, implementations
\newcounter{RapportFRsubequation}[equation]

% as shown when called by user from \ref, \label and in table of contents
\def\theequation{\arabic{equation}}                          % 1
\def\theRapportFRsubequation{\theequation\alph{RapportFRsubequation}}  % 1a (used only by RapportFRtran's RapportFReqnarray)
\ifCLASSOPTIONcompsoc
% compsoc is all arabic
\def\thesection{\arabic{section}}                
\def\thesubsection{\thesection.\arabic{subsection}}
\def\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\def\theparagraph{\thesubsubsection.\arabic{paragraph}}
\else
\def\thesection{\Roman{section}}                             % I
% V1.7, \mbox prevents breaks around - 
\def\thesubsection{\mbox{\thesection-\Alph{subsection}}}     % I-A
% V1.7 use I-A1 format used by RapportFR rather than I-A.1
\def\thesubsubsection{\thesubsection\arabic{subsubsection}}  % I-A1
\def\theparagraph{\thesubsubsection\alph{paragraph}}         % I-A1a
\fi

% From Heiko Oberdiek. Because of the \mbox in \thesubsection, we need to
% tell hyperref to disable the \mbox command when making PDF bookmarks.
% This done already with hyperref.sty version 6.74o and later, but
% it will not hurt to do it here again for users of older versions.
\@ifundefined{pdfstringdefPreHook}{\let\pdfstringdefPreHook\@empty}{}%
\g@addto@macro\pdfstringdefPreHook{\let\mbox\relax}


% Main text forms (how shown in main text headings)
% V1.6, using \thesection in \thesectiondis allows changes
% in the former to automatically appear in the latter
\ifCLASSOPTIONcompsoc
  \ifCLASSOPTIONconference% compsoc conference
    \def\thesectiondis{\thesection.}
    \def\thesubsectiondis{\thesectiondis\arabic{subsection}.}
    \def\thesubsubsectiondis{\thesubsectiondis\arabic{subsubsection}.}
    \def\theparagraphdis{\thesubsubsectiondis\arabic{paragraph}.}
  \else% compsoc not conferencs
    \def\thesectiondis{\thesection}
    \def\thesubsectiondis{\thesectiondis.\arabic{subsection}}
    \def\thesubsubsectiondis{\thesubsectiondis.\arabic{subsubsection}}
    \def\theparagraphdis{\thesubsubsectiondis.\arabic{paragraph}}
  \fi
\else% not compsoc
  \def\thesectiondis{\thesection.}                   % I.
  \def\thesubsectiondis{\Alph{subsection}.}          % B.
  \def\thesubsubsectiondis{\arabic{subsubsection})}  % 3)
  \def\theparagraphdis{\alph{paragraph})}            % d)
\fi

% just like LaTeX2e's \@eqnnum
\def\theequationdis{{\normalfont \normalcolor (\theequation)}}% (1)
% RapportFRsubequation used only by RapportFRtran's RapportFReqnarray
\def\theRapportFRsubequationdis{{\normalfont \normalcolor (\theRapportFRsubequation)}}% (1a)
% redirect LaTeX2e's equation number display and all that depend on
% it, through RapportFRtran's \theequationdis
\def\@eqnnum{\theequationdis}



% V1.7 provide string macros as article.cls does
\def\contentsname{Contents}
\def\listfigurename{List of Figures}
\def\listtablename{List of Tables}
\def\refname{References}
\def\indexname{Index}
\def\figurename{Fig.}
\def\tablename{TABLE}
\@RapportFRcompsocconfonly{\def\figurename{Figure}\def\tablename{Table}}
\def\partname{Part}
\def\appendixname{Annexe}
\def\abstractname{R\'esum\'e}
% RapportFR specific names
\def\RapportFRkeywordsname{Mots cl\'es}
\def\RapportFRproofname{Preuve}


% LIST OF FIGURES AND TABLES AND TABLE OF CONTENTS
%
\def\@pnumwidth{1.55em}
\def\@tocrmarg{2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{3}

% adjusted some spacings here so that section numbers will not easily 
% collide with the section titles. 
% VIII; VIII-A; and VIII-A.1 are usually the worst offenders.
% MDS 1/2001
\def\tableofcontents{\section*{\contentsname}\@starttoc{toc}}
\def\l@section#1#2{\addpenalty{\@secpenalty}\addvspace{1.0em plus 1pt}%
    \@tempdima 2.75em \begingroup \parindent \z@ \rightskip \@pnumwidth%
    \parfillskip-\@pnumwidth {\bfseries\leavevmode #1}\hfil\hbox to\@pnumwidth{\hss #2}\par%
    \endgroup}
% argument format #1:level, #2:labelindent,#3:labelsep
\def\l@subsection{\@dottedtocline{2}{2.75em}{3.75em}}
\def\l@subsubsection{\@dottedtocline{3}{6.5em}{4.5em}}
% must provide \l@ defs for ALL sublevels EVEN if tocdepth
% is such as they will not appear in the table of contents
% these defs are how TOC knows what level these things are!
\def\l@paragraph{\@dottedtocline{4}{6.5em}{5.5em}}
\def\l@subparagraph{\@dottedtocline{5}{6.5em}{6.5em}}
\def\listoffigures{\section*{\listfigurename}\@starttoc{lof}}
\def\l@figure{\@dottedtocline{1}{0em}{2.75em}}
\def\listoftables{\section*{\listtablename}\@starttoc{lot}}
\let\l@table\l@figure


%% Definitions for floats
%%
%% Normal Floats
\floatsep 1\baselineskip plus  0.2\baselineskip minus  0.2\baselineskip
\textfloatsep 1.7\baselineskip plus  0.2\baselineskip minus  0.4\baselineskip
\@fptop 0pt plus 1fil
\@fpsep 0.75\baselineskip plus 2fil 
\@fpbot 0pt plus 1fil
\def\topfraction{0.9}
\def\bottomfraction{0.4}
\def\floatpagefraction{0.8}
% V1.7, let top floats approach 90% of page
\def\textfraction{0.1}

%% Double Column Floats
\dblfloatsep 1\baselineskip plus  0.2\baselineskip minus  0.2\baselineskip

\dbltextfloatsep 1.7\baselineskip plus  0.2\baselineskip minus  0.4\baselineskip
% Note that it would be nice if the rubber here actually worked in LaTeX2e.
% There is a long standing limitation in LaTeX, first discovered (to the best
% of my knowledge) by Alan Jeffrey in 1992. LaTeX ignores the stretchable
% portion of \dbltextfloatsep, and as a result, double column figures can and
% do result in an non-integer number of lines in the main text columns with
% underfull vbox errors as a consequence. A post to comp.text.tex
% by Donald Arseneau confirms that this had not yet been fixed in 1998.
% RapportFRtran V1.6 will fix this problem for you in the titles, but it doesn't
% protect you from other double floats. Happy vspace'ing.

\@dblfptop 0pt plus 1fil
\@dblfpsep 0.75\baselineskip plus 2fil
\@dblfpbot 0pt plus 1fil
\def\dbltopfraction{0.8}
\def\dblfloatpagefraction{0.8}
\setcounter{dbltopnumber}{4}

\intextsep 1\baselineskip plus 0.2\baselineskip minus  0.2\baselineskip
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}



% article class provides these, we should too.
\newlength\abovecaptionskip
\newlength\belowcaptionskip
% but only \abovecaptionskip is used above figure captions and *below* table
% captions
\setlength\abovecaptionskip{0.5\baselineskip}
\setlength\belowcaptionskip{0pt}
% V1.6 create hooks in case the caption spacing ever needs to be
% overridden by a user
\def\@RapportFRfigurecaptionsepspace{\vskip\abovecaptionskip\relax}%
\def\@RapportFRtablecaptionsepspace{\vskip\abovecaptionskip\relax}%


% 1.6b revise caption system so that \@makecaption uses two arguments
% as with LaTeX2e. Otherwise, there will be problems when using hyperref.
\def\@RapportFRtablestring{table}

\ifCLASSOPTIONcompsoc
% V1.7 compsoc \@makecaption
\ifCLASSOPTIONconference% compsoc conference
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@RapportFRtablestring%
% if a table, do table caption
\normalsize\begin{center}{\normalfont\sffamily\normalsize {#1.}~ #2}\end{center}%
\@RapportFRtablecaptionsepspace
% if not a table, format it as a figure
\else
\@RapportFRfigurecaptionsepspace
\setbox\@tempboxa\hbox{\normalfont\sffamily\normalsize {#1.}~ #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\sffamily\normalsize {#1.}~ }%
\parbox[t]{\hsize}{\normalfont\sffamily\normalsize \noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, center
\else%
\hbox to\hsize{\normalfont\sffamily\normalsize\hfil\box\@tempboxa\hfil}%
\fi\fi}
\else% nonconference compsoc
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@RapportFRtablestring%
% if a table, do table caption
\normalsize\begin{center}{\normalfont\sffamily\normalsize #1}\\{\normalfont\sffamily\normalsize #2}\end{center}%
\@RapportFRtablecaptionsepspace
% if not a table, format it as a figure
\else
\@RapportFRfigurecaptionsepspace
\setbox\@tempboxa\hbox{\normalfont\sffamily\normalsize {#1.}~ #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\sffamily\normalsize {#1.}~ }%
\parbox[t]{\hsize}{\normalfont\sffamily\normalsize \noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, left justify
\else%
\hbox to\hsize{\normalfont\sffamily\normalsize\box\@tempboxa\hfil}%
\fi\fi}
\fi

\else% traditional noncompsoc \@makecaption
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@RapportFRtablestring%
% if a table, do table caption
\footnotesize\begin{center}{\normalfont\footnotesize #1}\\{\normalfont\footnotesize\scshape #2}\end{center}%
\@RapportFRtablecaptionsepspace
% if not a table, format it as a figure
\else
\@RapportFRfigurecaptionsepspace
% 3/2001 use footnotesize, not small; use two nonbreaking spaces, not one
\setbox\@tempboxa\hbox{\normalfont\footnotesize {#1.}~~ #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\footnotesize {#1.}~~ }%
\parbox[t]{\hsize}{\normalfont\footnotesize\noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, center if conference, left justify otherwise
\else%
\ifCLASSOPTIONconference \hbox to\hsize{\normalfont\footnotesize\hfil\box\@tempboxa\hfil}%
\else \hbox to\hsize{\normalfont\footnotesize\box\@tempboxa\hfil}%
\fi\fi\fi}
\fi



% V1.7 disable captions class option, do so in a way that retains operation of \label
% within \caption
\ifCLASSOPTIONcaptionsoff
\long\def\@makecaption#1#2{\vspace*{2em}\footnotesize\begin{center}{\footnotesize #1}\end{center}%
\let\@RapportFRtemporiglabeldefsave\label
\let\@RapportFRtemplabelargsave\relax
\def\label##1{\gdef\@RapportFRtemplabelargsave{##1}}%
\setbox\@tempboxa\hbox{#2}%
\let\label\@RapportFRtemporiglabeldefsave
\ifx\@RapportFRtemplabelargsave\relax\else\label{\@RapportFRtemplabelargsave}\fi}
\fi


% V1.7 define end environments with \def not \let so as to work OK with
% preview-latex
\newcounter{figure}
\def\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\def\figure{\@float{figure}}
\def\endfigure{\end@float}
\@namedef{figure*}{\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}
\newcounter{table}
\ifCLASSOPTIONcompsoc
\def\thetable{\arabic{table}}
\else
\def\thetable{\@Roman\c@table}
\fi
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
% V1.6 RapportFR uses 8pt text for tables
% to default to footnotesize, we hack into LaTeX2e's \@floatboxreset and pray
\def\table{\def\@floatboxreset{\reset@font\footnotesize\@setminipage}\@float{table}}
\def\endtable{\end@float}
% v1.6b double column tables need to default to footnotesize as well.
\@namedef{table*}{\def\@floatboxreset{\reset@font\footnotesize\@setminipage}\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}




%%
%% START OF RapportFReqnarry DEFINITIONS
%%
%% Inspired by the concepts, examples, and previous works of LaTeX 
%% coders and developers such as Donald Arseneau, Fred Bartlett, 
%% David Carlisle, Tony Liu, Frank Mittelbach, Piet van Oostrum, 
%% Roland Winkler and Mark Wooding.
%% I don't make the claim that my work here is even near their calibre. ;)


% hook to allow easy changeover to RapportFRtran.cls/tools.sty error reporting
\def\@RapportFRclspkgerror{\ClassError{RapportFRtran}}

\newif\if@RapportFReqnarraystarform% flag to indicate if the environment was called as the star form
\@RapportFReqnarraystarformfalse

\newif\if@advanceRapportFReqncolcnt% tracks if the environment should advance the col counter
% allows a way to make an \RapportFReqnarraybox that can be used within an \RapportFReqnarray
% used by RapportFReqnarraymulticol so that it can work properly in both
\@advanceRapportFReqncolcnttrue

\newcount\@RapportFReqnnumcols % tracks how many RapportFReqnarray cols are defined
\newcount\@RapportFReqncolcnt  % tracks how many RapportFReqnarray cols the user actually used


% The default math style used by the columns
\def\RapportFReqnarraymathstyle{\displaystyle}
% The default text style used by the columns
% default to using the current font
\def\RapportFReqnarraytextstyle{\relax}

% like the iedlistdecl but for \RapportFReqnarray
\def\RapportFReqnarraydecl{\relax}
\def\RapportFReqnarrayboxdecl{\relax}

% \yesnumber is the opposite of \nonumber
% a novel concept with the same def as the equationarray package
% However, we give RapportFR versions too since some LaTeX packages such as 
% the MDWtools mathenv.sty redefine \nonumber to something else.
\providecommand{\yesnumber}{\global\@eqnswtrue}
\def\RapportFRyesnumber{\global\@eqnswtrue}
\def\RapportFRnonumber{\global\@eqnswfalse}


\def\RapportFRyessubnumber{\global\@RapportFRissubequationtrue\global\@eqnswtrue%
\if@RapportFReqnarrayISinner% only do something inside an RapportFReqnarray
\if@RapportFRlastlinewassubequation\addtocounter{equation}{-1}\else\setcounter{RapportFRsubequation}{1}\fi%
\def\@currentlabel{\p@RapportFRsubequation\theRapportFRsubequation}\fi}

% flag to indicate that an equation is a sub equation
\newif\if@RapportFRissubequation%
\@RapportFRissubequationfalse

% allows users to "push away" equations that get too close to the equation numbers
\def\RapportFReqnarraynumspace{\hphantom{\if@RapportFRissubequation\theRapportFRsubequationdis\else\theequationdis\fi}}

% provides a way to span multiple columns within RapportFReqnarray environments
% will consider \if@advanceRapportFReqncolcnt before globally advancing the
% column counter - so as to work within \RapportFReqnarraybox
% usage: \RapportFReqnarraymulticol{number cols. to span}{col type}{cell text}
\long\def\RapportFReqnarraymulticol#1#2#3{\multispan{#1}%
% check if column is defined
\relax\expandafter\ifx\csname @RapportFReqnarraycolDEF#2\endcsname\@RapportFReqnarraycolisdefined%
\csname @RapportFReqnarraycolPRE#2\endcsname#3\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\csname @RapportFReqnarraycolPOST#2\endcsname%
\else% if not, error and use default type
\@RapportFRclspkgerror{Invalid column type "#2" in \string\RapportFReqnarraymulticol.\MessageBreak
Using a default centering column instead}%
{You must define RapportFReqnarray column types before use.}%
\csname @RapportFReqnarraycolPRE@RapportFRdefault\endcsname#3\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\csname @RapportFReqnarraycolPOST@RapportFRdefault\endcsname%
\fi%
% advance column counter only if the RapportFReqnarray environment wants it
\if@advanceRapportFReqncolcnt\global\advance\@RapportFReqncolcnt by #1\relax\fi}

% like \omit, but maintains track of the column counter for \RapportFReqnarray
\def\RapportFReqnarrayomit{\omit\if@advanceRapportFReqncolcnt\global\advance\@RapportFReqncolcnt by 1\relax\fi}


% provides a way to define a letter referenced column type
% usage: \RapportFReqnarraydefcol{col. type letter/name}{pre insertion text}{post insertion text}
\def\RapportFReqnarraydefcol#1#2#3{\expandafter\def\csname @RapportFReqnarraycolPRE#1\endcsname{#2}%
\expandafter\def\csname @RapportFReqnarraycolPOST#1\endcsname{#3}%
\expandafter\def\csname @RapportFReqnarraycolDEF#1\endcsname{1}}


% provides a way to define a numerically referenced inter-column glue types
% usage: \RapportFReqnarraydefcolsep{col. glue number}{glue definition}
\def\RapportFReqnarraydefcolsep#1#2{\expandafter\def\csname @RapportFReqnarraycolSEP\romannumeral #1\endcsname{#2}%
\expandafter\def\csname @RapportFReqnarraycolSEPDEF\romannumeral #1\endcsname{1}}


\def\@RapportFReqnarraycolisdefined{1}% just a macro for 1, used for checking undefined column types


% expands and appends the given argument to the \@RapportFRtrantmptoksA token list
% used to build up the \halign preamble
\def\@RapportFRappendtoksA#1{\edef\@@RapportFRappendtoksA{\@RapportFRtrantmptoksA={\the\@RapportFRtrantmptoksA #1}}%
\@@RapportFRappendtoksA}

% also appends to \@RapportFRtrantmptoksA, but does not expand the argument
% uses \toks8 as a scratchpad register
\def\@RapportFRappendNOEXPANDtoksA#1{\toks8={#1}%
\edef\@@RapportFRappendNOEXPANDtoksA{\@RapportFRtrantmptoksA={\the\@RapportFRtrantmptoksA\the\toks8}}%
\@@RapportFRappendNOEXPANDtoksA}

% define some common column types for the user
% math
\RapportFReqnarraydefcol{l}{$\RapportFReqnarraymathstyle}{$\hfil}
\RapportFReqnarraydefcol{c}{\hfil$\RapportFReqnarraymathstyle}{$\hfil}
\RapportFReqnarraydefcol{r}{\hfil$\RapportFReqnarraymathstyle}{$}
\RapportFReqnarraydefcol{L}{$\RapportFReqnarraymathstyle{}}{{}$\hfil}
\RapportFReqnarraydefcol{C}{\hfil$\RapportFReqnarraymathstyle{}}{{}$\hfil}
\RapportFReqnarraydefcol{R}{\hfil$\RapportFReqnarraymathstyle{}}{{}$}
% text
\RapportFReqnarraydefcol{s}{\RapportFReqnarraytextstyle}{\hfil}
\RapportFReqnarraydefcol{t}{\hfil\RapportFReqnarraytextstyle}{\hfil}
\RapportFReqnarraydefcol{u}{\hfil\RapportFReqnarraytextstyle}{}

% vertical rules
\RapportFReqnarraydefcol{v}{}{\vrule width\arrayrulewidth}
\RapportFReqnarraydefcol{vv}{\vrule width\arrayrulewidth\hfil}{\hfil\vrule width\arrayrulewidth}
\RapportFReqnarraydefcol{V}{}{\vrule width\arrayrulewidth\hskip\doublerulesep\vrule width\arrayrulewidth}
\RapportFReqnarraydefcol{VV}{\vrule width\arrayrulewidth\hskip\doublerulesep\vrule width\arrayrulewidth\hfil}%
{\hfil\vrule width\arrayrulewidth\hskip\doublerulesep\vrule width\arrayrulewidth}

% horizontal rules
\RapportFReqnarraydefcol{h}{}{\leaders\hrule height\arrayrulewidth\hfil}
\RapportFReqnarraydefcol{H}{}{\leaders\vbox{\hrule width\arrayrulewidth\vskip\doublerulesep\hrule width\arrayrulewidth}\hfil}

% plain
\RapportFReqnarraydefcol{x}{}{}
\RapportFReqnarraydefcol{X}{$}{$}

% the default column type to use in the event a column type is not defined
\RapportFReqnarraydefcol{@RapportFRdefault}{\hfil$\RapportFReqnarraymathstyle}{$\hfil}


% a zero tabskip (used for "-" col types)
\def\@RapportFReqnarraycolSEPzero{0pt plus 0pt minus 0pt}
% a centering tabskip (used for "+" col types)
\def\@RapportFReqnarraycolSEPcenter{1000pt plus 0pt minus 1000pt}

% top level default tabskip glues for the start, end, and inter-column
% may be reset within environments not always at the top level, e.g., \RapportFReqnarraybox
\edef\@RapportFReqnarraycolSEPdefaultstart{\@RapportFReqnarraycolSEPcenter}% default start glue
\edef\@RapportFReqnarraycolSEPdefaultend{\@RapportFReqnarraycolSEPcenter}% default end glue
\edef\@RapportFReqnarraycolSEPdefaultmid{\@RapportFReqnarraycolSEPzero}% default inter-column glue



% creates a vertical rule that extends from the bottom to the top a a cell
% Provided in case other packages redefine \vline some other way.
% usage: \RapportFReqnarrayvrule[rule thickness]
% If no argument is provided, \arrayrulewidth will be used for the rule thickness. 
\newcommand\RapportFReqnarrayvrule[1][\arrayrulewidth]{\vrule\@width#1\relax}

% creates a blank separator row
% usage: \RapportFReqnarrayseprow[separation length][font size commands]
% default is \RapportFReqnarrayseprow[0.25\normalbaselineskip][\relax]
% blank arguments inherit the default values
% uses \skip5 as a scratch register - calls \@RapportFReqnarraystrutsize which uses more scratch registers
\def\RapportFReqnarrayseprow{\relax\@ifnextchar[{\@RapportFReqnarrayseprow}{\@RapportFReqnarrayseprow[0.25\normalbaselineskip]}}
\def\@RapportFReqnarrayseprow[#1]{\relax\@ifnextchar[{\@@RapportFReqnarrayseprow[#1]}{\@@RapportFReqnarrayseprow[#1][\relax]}}
\def\@@RapportFReqnarrayseprow[#1][#2]{\def\@RapportFReqnarrayseprowARGONE{#1}%
\ifx\@RapportFReqnarrayseprowARGONE\@empty%
% get the skip value, based on the font commands
% use skip5 because \RapportFReqnarraystrutsize uses \skip0, \skip2, \skip3
% assign within a bogus box to confine the font changes
{\setbox0=\hbox{#2\relax\global\skip5=0.25\normalbaselineskip}}%
\else%
{\setbox0=\hbox{#2\relax\global\skip5=#1}}%
\fi%
\@RapportFReqnarrayhoptolastcolumn\RapportFReqnarraystrutsize{\skip5}{0pt}[\relax]\relax}

% creates a blank separator row, but omits all the column templates
% usage: \RapportFReqnarrayseprowcut[separation length][font size commands]
% default is \RapportFReqnarrayseprowcut[0.25\normalbaselineskip][\relax]
% blank arguments inherit the default values
% uses \skip5 as a scratch register - calls \@RapportFReqnarraystrutsize which uses more scratch registers
\def\RapportFReqnarrayseprowcut{\multispan{\@RapportFReqnnumcols}\relax% span all the cols
% advance column counter only if the RapportFReqnarray environment wants it
\if@advanceRapportFReqncolcnt\global\advance\@RapportFReqncolcnt by \@RapportFReqnnumcols\relax\fi%
\@ifnextchar[{\@RapportFReqnarrayseprowcut}{\@RapportFReqnarrayseprowcut[0.25\normalbaselineskip]}}
\def\@RapportFReqnarrayseprowcut[#1]{\relax\@ifnextchar[{\@@RapportFReqnarrayseprowcut[#1]}{\@@RapportFReqnarrayseprowcut[#1][\relax]}}
\def\@@RapportFReqnarrayseprowcut[#1][#2]{\def\@RapportFReqnarrayseprowARGONE{#1}%
\ifx\@RapportFReqnarrayseprowARGONE\@empty%
% get the skip value, based on the font commands
% use skip5 because \RapportFReqnarraystrutsize uses \skip0, \skip2, \skip3
% assign within a bogus box to confine the font changes
{\setbox0=\hbox{#2\relax\global\skip5=0.25\normalbaselineskip}}%
\else%
{\setbox0=\hbox{#2\relax\global\skip5=#1}}%
\fi%
\RapportFReqnarraystrutsize{\skip5}{0pt}[\relax]\relax}



% draws a single rule across all the columns optional
% argument determines the rule width, \arrayrulewidth is the default
% updates column counter as needed and turns off struts
% usage: \RapportFReqnarrayrulerow[rule line thickness]
\def\RapportFReqnarrayrulerow{\multispan{\@RapportFReqnnumcols}\relax% span all the cols
% advance column counter only if the RapportFReqnarray environment wants it
\if@advanceRapportFReqncolcnt\global\advance\@RapportFReqncolcnt by \@RapportFReqnnumcols\relax\fi%
\@ifnextchar[{\@RapportFReqnarrayrulerow}{\@RapportFReqnarrayrulerow[\arrayrulewidth]}}
\def\@RapportFReqnarrayrulerow[#1]{\leaders\hrule height#1\hfil\relax% put in our rule 
% turn off any struts
\RapportFReqnarraystrutsize{0pt}{0pt}[\relax]\relax}


% draws a double rule by using a single rule row, a separator row, and then
% another single rule row 
% first optional argument determines the rule thicknesses, \arrayrulewidth is the default
% second optional argument determines the rule spacing, \doublerulesep is the default
% usage: \RapportFReqnarraydblrulerow[rule line thickness][rule spacing]
\def\RapportFReqnarraydblrulerow{\multispan{\@RapportFReqnnumcols}\relax% span all the cols
% advance column counter only if the RapportFReqnarray environment wants it
\if@advanceRapportFReqncolcnt\global\advance\@RapportFReqncolcnt by \@RapportFReqnnumcols\relax\fi%
\@ifnextchar[{\@RapportFReqnarraydblrulerow}{\@RapportFReqnarraydblrulerow[\arrayrulewidth]}}
\def\@RapportFReqnarraydblrulerow[#1]{\relax\@ifnextchar[{\@@RapportFReqnarraydblrulerow[#1]}%
{\@@RapportFReqnarraydblrulerow[#1][\doublerulesep]}}
\def\@@RapportFReqnarraydblrulerow[#1][#2]{\def\@RapportFReqnarraydblrulerowARG{#1}%
% we allow the user to say \RapportFReqnarraydblrulerow[][]
\ifx\@RapportFReqnarraydblrulerowARG\@empty%
\@RapportFReqnarrayrulerow[\arrayrulewidth]%
\else%
\@RapportFReqnarrayrulerow[#1]\relax%
\fi%
\def\@RapportFReqnarraydblrulerowARG{#2}%
\ifx\@RapportFReqnarraydblrulerowARG\@empty%
\\\RapportFReqnarrayseprow[\doublerulesep][\relax]%
\else%
\\\RapportFReqnarrayseprow[#2][\relax]%
\fi%
\\\multispan{\@RapportFReqnnumcols}%
% advance column counter only if the RapportFReqnarray environment wants it
\if@advanceRapportFReqncolcnt\global\advance\@RapportFReqncolcnt by \@RapportFReqnnumcols\relax\fi%
\def\@RapportFReqnarraydblrulerowARG{#1}%
\ifx\@RapportFReqnarraydblrulerowARG\@empty%
\@RapportFReqnarrayrulerow[\arrayrulewidth]%
\else%
\@RapportFReqnarrayrulerow[#1]%
\fi%
}

% draws a double rule by using a single rule row, a separator (cutting) row, and then
% another single rule row 
% first optional argument determines the rule thicknesses, \arrayrulewidth is the default
% second optional argument determines the rule spacing, \doublerulesep is the default
% usage: \RapportFReqnarraydblrulerow[rule line thickness][rule spacing]
\def\RapportFReqnarraydblrulerowcut{\multispan{\@RapportFReqnnumcols}\relax% span all the cols
% advance column counter only if the RapportFReqnarray environment wants it
\if@advanceRapportFReqncolcnt\global\advance\@RapportFReqncolcnt by \@RapportFReqnnumcols\relax\fi%
\@ifnextchar[{\@RapportFReqnarraydblrulerowcut}{\@RapportFReqnarraydblrulerowcut[\arrayrulewidth]}}
\def\@RapportFReqnarraydblrulerowcut[#1]{\relax\@ifnextchar[{\@@RapportFReqnarraydblrulerowcut[#1]}%
{\@@RapportFReqnarraydblrulerowcut[#1][\doublerulesep]}}
\def\@@RapportFReqnarraydblrulerowcut[#1][#2]{\def\@RapportFReqnarraydblrulerowARG{#1}%
% we allow the user to say \RapportFReqnarraydblrulerow[][]
\ifx\@RapportFReqnarraydblrulerowARG\@empty%
\@RapportFReqnarrayrulerow[\arrayrulewidth]%
\else%
\@RapportFReqnarrayrulerow[#1]%
\fi%
\def\@RapportFReqnarraydblrulerowARG{#2}%
\ifx\@RapportFReqnarraydblrulerowARG\@empty%
\\\RapportFReqnarrayseprowcut[\doublerulesep][\relax]%
\else%
\\\RapportFReqnarrayseprowcut[#2][\relax]%
\fi%
\\\multispan{\@RapportFReqnnumcols}%
% advance column counter only if the RapportFReqnarray environment wants it
\if@advanceRapportFReqncolcnt\global\advance\@RapportFReqncolcnt by \@RapportFReqnnumcols\relax\fi%
\def\@RapportFReqnarraydblrulerowARG{#1}%
\ifx\@RapportFReqnarraydblrulerowARG\@empty%
\@RapportFReqnarrayrulerow[\arrayrulewidth]%
\else%
\@RapportFReqnarrayrulerow[#1]%
\fi%
}



% inserts a full row's worth of &'s
% relies on \@RapportFReqnnumcols to provide the correct number of columns
% uses \@RapportFRtrantmptoksA, \count0 as scratch registers
\def\@RapportFReqnarrayhoptolastcolumn{\@RapportFRtrantmptoksA={}\count0=1\relax%
\loop% add cols if the user did not use them all
\ifnum\count0<\@RapportFReqnnumcols\relax%
\@RapportFRappendtoksA{&}%
\advance\count0 by 1\relax% update the col count
\repeat%
\the\@RapportFRtrantmptoksA%execute the &'s
}



\newif\if@RapportFReqnarrayISinner % flag to indicate if we are within the lines
\@RapportFReqnarrayISinnerfalse    % of an RapportFReqnarray - after the RapportFReqnarraydecl

\edef\@RapportFReqnarrayTHEstrutheight{0pt} % height and depth of RapportFReqnarray struts
\edef\@RapportFReqnarrayTHEstrutdepth{0pt}

\edef\@RapportFReqnarrayTHEmasterstrutheight{0pt} % default height and depth of
\edef\@RapportFReqnarrayTHEmasterstrutdepth{0pt}  % struts within an RapportFReqnarray

\edef\@RapportFReqnarrayTHEmasterstrutHSAVE{0pt} % saved master strut height
\edef\@RapportFReqnarrayTHEmasterstrutDSAVE{0pt} % and depth

\newif\if@RapportFReqnarrayusemasterstrut % flag to indicate that the master strut value
\@RapportFReqnarrayusemasterstruttrue     % is to be used



% saves the strut height and depth of the master strut
\def\@RapportFReqnarraymasterstrutsave{\relax%
\expandafter\skip0=\@RapportFReqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@RapportFReqnarrayTHEmasterstrutdepth\relax%
% remove stretchability
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% save values
\edef\@RapportFReqnarrayTHEmasterstrutHSAVE{\the\dimen0}%
\edef\@RapportFReqnarrayTHEmasterstrutDSAVE{\the\dimen2}}

% restores the strut height and depth of the master strut
\def\@RapportFReqnarraymasterstrutrestore{\relax%
\expandafter\skip0=\@RapportFReqnarrayTHEmasterstrutHSAVE\relax%
\expandafter\skip2=\@RapportFReqnarrayTHEmasterstrutDSAVE\relax%
% remove stretchability
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% restore values
\edef\@RapportFReqnarrayTHEmasterstrutheight{\the\dimen0}%
\edef\@RapportFReqnarrayTHEmasterstrutdepth{\the\dimen2}}


% globally restores the strut height and depth to the 
% master values and sets the master strut flag to true
\def\@RapportFReqnarraystrutreset{\relax%
\expandafter\skip0=\@RapportFReqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@RapportFReqnarrayTHEmasterstrutdepth\relax%
% remove stretchability
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% restore values
\xdef\@RapportFReqnarrayTHEstrutheight{\the\dimen0}%
\xdef\@RapportFReqnarrayTHEstrutdepth{\the\dimen2}%
\global\@RapportFReqnarrayusemasterstruttrue}


% if the master strut is not to be used, make the current
% values of \@RapportFReqnarrayTHEstrutheight, \@RapportFReqnarrayTHEstrutdepth
% and the use master strut flag, global
% this allows user strut commands issued in the last column to be carried
% into the isolation/strut column
\def\@RapportFReqnarrayglobalizestrutstatus{\relax%
\if@RapportFReqnarrayusemasterstrut\else%
\xdef\@RapportFReqnarrayTHEstrutheight{\@RapportFReqnarrayTHEstrutheight}%
\xdef\@RapportFReqnarrayTHEstrutdepth{\@RapportFReqnarrayTHEstrutdepth}%
\global\@RapportFReqnarrayusemasterstrutfalse%
\fi}



% usage: \RapportFReqnarraystrutsize{height}{depth}[font size commands]
% If called outside the lines of an RapportFReqnarray, sets the height
% and depth of both the master and local struts. If called inside
% an RapportFReqnarray line, sets the height and depth of the local strut
% only and sets the flag to indicate the use of the local strut
% values. If the height or depth is left blank, 0.7\normalbaselineskip
% and 0.3\normalbaselineskip will be used, respectively.
% The optional argument can be used to evaluate the lengths under
% a different font size and styles. If none is specified, the current
% font is used.
% uses scratch registers \skip0, \skip2, \skip3, \dimen0, \dimen2
\def\RapportFReqnarraystrutsize#1#2{\relax\@ifnextchar[{\@RapportFReqnarraystrutsize{#1}{#2}}{\@RapportFReqnarraystrutsize{#1}{#2}[\relax]}}
\def\@RapportFReqnarraystrutsize#1#2[#3]{\def\@RapportFReqnarraystrutsizeARG{#1}%
\ifx\@RapportFReqnarraystrutsizeARG\@empty%
{\setbox0=\hbox{#3\relax\global\skip3=0.7\normalbaselineskip}}%
\skip0=\skip3\relax%
\else% arg one present
{\setbox0=\hbox{#3\relax\global\skip3=#1\relax}}%
\skip0=\skip3\relax%
\fi% if null arg
\def\@RapportFReqnarraystrutsizeARG{#2}%
\ifx\@RapportFReqnarraystrutsizeARG\@empty%
{\setbox0=\hbox{#3\relax\global\skip3=0.3\normalbaselineskip}}%
\skip2=\skip3\relax%
\else% arg two present
{\setbox0=\hbox{#3\relax\global\skip3=#2\relax}}%
\skip2=\skip3\relax%
\fi% if null arg
% remove stretchability, just to be safe
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% dimen0 = height, dimen2 = depth
\if@RapportFReqnarrayISinner% inner does not touch master strut size
\edef\@RapportFReqnarrayTHEstrutheight{\the\dimen0}%
\edef\@RapportFReqnarrayTHEstrutdepth{\the\dimen2}%
\@RapportFReqnarrayusemasterstrutfalse% do not use master
\else% outer, have to set master strut too
\edef\@RapportFReqnarrayTHEmasterstrutheight{\the\dimen0}%
\edef\@RapportFReqnarrayTHEmasterstrutdepth{\the\dimen2}%
\edef\@RapportFReqnarrayTHEstrutheight{\the\dimen0}%
\edef\@RapportFReqnarrayTHEstrutdepth{\the\dimen2}%
\@RapportFReqnarrayusemasterstruttrue% use master strut
\fi}


% usage: \RapportFReqnarraystrutsizeadd{added height}{added depth}[font size commands]
% If called outside the lines of an RapportFReqnarray, adds the given height
% and depth to both the master and local struts.
% If called inside an RapportFReqnarray line, adds the given height and depth
% to the local strut only and sets the flag to indicate the use 
% of the local strut values.
% In both cases, if a height or depth is left blank, 0pt is used instead.
% The optional argument can be used to evaluate the lengths under
% a different font size and styles. If none is specified, the current
% font is used.
% uses scratch registers \skip0, \skip2, \skip3, \dimen0, \dimen2
\def\RapportFReqnarraystrutsizeadd#1#2{\relax\@ifnextchar[{\@RapportFReqnarraystrutsizeadd{#1}{#2}}{\@RapportFReqnarraystrutsizeadd{#1}{#2}[\relax]}}
\def\@RapportFReqnarraystrutsizeadd#1#2[#3]{\def\@RapportFReqnarraystrutsizearg{#1}%
\ifx\@RapportFReqnarraystrutsizearg\@empty%
\skip0=0pt\relax%
\else% arg one present
{\setbox0=\hbox{#3\relax\global\skip3=#1}}%
\skip0=\skip3\relax%
\fi% if null arg
\def\@RapportFReqnarraystrutsizearg{#2}%
\ifx\@RapportFReqnarraystrutsizearg\@empty%
\skip2=0pt\relax%
\else% arg two present
{\setbox0=\hbox{#3\relax\global\skip3=#2}}%
\skip2=\skip3\relax%
\fi% if null arg
% remove stretchability, just to be safe
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% dimen0 = height, dimen2 = depth
\if@RapportFReqnarrayISinner% inner does not touch master strut size
% get local strut size
\expandafter\skip0=\@RapportFReqnarrayTHEstrutheight\relax%
\expandafter\skip2=\@RapportFReqnarrayTHEstrutdepth\relax%
% add it to the user supplied values
\advance\dimen0 by \skip0\relax%
\advance\dimen2 by \skip2\relax%
% update the local strut size
\edef\@RapportFReqnarrayTHEstrutheight{\the\dimen0}%
\edef\@RapportFReqnarrayTHEstrutdepth{\the\dimen2}%
\@RapportFReqnarrayusemasterstrutfalse% do not use master
\else% outer, have to set master strut too
% get master strut size
\expandafter\skip0=\@RapportFReqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@RapportFReqnarrayTHEmasterstrutdepth\relax%
% add it to the user supplied values
\advance\dimen0 by \skip0\relax%
\advance\dimen2 by \skip2\relax%
% update the local and master strut sizes
\edef\@RapportFReqnarrayTHEmasterstrutheight{\the\dimen0}%
\edef\@RapportFReqnarrayTHEmasterstrutdepth{\the\dimen2}%
\edef\@RapportFReqnarrayTHEstrutheight{\the\dimen0}%
\edef\@RapportFReqnarrayTHEstrutdepth{\the\dimen2}%
\@RapportFReqnarrayusemasterstruttrue% use master strut
\fi}


% allow user a way to see the struts
\newif\ifRapportFRvisiblestruts
\RapportFRvisiblestrutsfalse

% inserts an invisible strut using the master or local strut values
% uses scratch registers \skip0, \skip2, \dimen0, \dimen2
\def\@RapportFReqnarrayinsertstrut{\relax%
\if@RapportFReqnarrayusemasterstrut
% get master strut size
\expandafter\skip0=\@RapportFReqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@RapportFReqnarrayTHEmasterstrutdepth\relax%
\else%
% get local strut size
\expandafter\skip0=\@RapportFReqnarrayTHEstrutheight\relax%
\expandafter\skip2=\@RapportFReqnarrayTHEstrutdepth\relax%
\fi%
% remove stretchability, probably not needed
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% dimen0 = height, dimen2 = depth
% allow user to see struts if desired
\ifRapportFRvisiblestruts%
\vrule width0.2pt height\dimen0 depth\dimen2\relax%
\else%
\vrule width0pt height\dimen0 depth\dimen2\relax\fi}


% creates an invisible strut, useable even outside \RapportFReqnarray
% if \RapportFRvisiblestrutstrue, the strut will be visible and 0.2pt wide. 
% usage: \RapportFRstrut[height][depth][font size commands]
% default is \RapportFRstrut[0.7\normalbaselineskip][0.3\normalbaselineskip][\relax]
% blank arguments inherit the default values
% uses \dimen0, \dimen2, \skip0, \skip2
\def\RapportFRstrut{\relax\@ifnextchar[{\@RapportFRstrut}{\@RapportFRstrut[0.7\normalbaselineskip]}}
\def\@RapportFRstrut[#1]{\relax\@ifnextchar[{\@@RapportFRstrut[#1]}{\@@RapportFRstrut[#1][0.3\normalbaselineskip]}}
\def\@@RapportFRstrut[#1][#2]{\relax\@ifnextchar[{\@@@RapportFRstrut[#1][#2]}{\@@@RapportFRstrut[#1][#2][\relax]}}
\def\@@@RapportFRstrut[#1][#2][#3]{\mbox{#3\relax%
\def\@RapportFRstrutARG{#1}%
\ifx\@RapportFRstrutARG\@empty%
\skip0=0.7\normalbaselineskip\relax%
\else%
\skip0=#1\relax%
\fi%
\def\@RapportFRstrutARG{#2}%
\ifx\@RapportFRstrutARG\@empty%
\skip2=0.3\normalbaselineskip\relax%
\else%
\skip2=#2\relax%
\fi%
% remove stretchability, probably not needed
\dimen0\skip0\relax%
\dimen2\skip2\relax%
\ifRapportFRvisiblestruts%
\vrule width0.2pt height\dimen0 depth\dimen2\relax%
\else%
\vrule width0.0pt height\dimen0 depth\dimen2\relax\fi}}


% enables strut mode by setting a default strut size and then zeroing the
% \baselineskip, \lineskip, \lineskiplimit and \jot
\def\RapportFReqnarraystrutmode{\RapportFReqnarraystrutsize{0.7\normalbaselineskip}{0.3\normalbaselineskip}[\relax]%
\baselineskip=0pt\lineskip=0pt\lineskiplimit=0pt\jot=0pt}



\def\RapportFReqnarray{\@RapportFReqnarraystarformfalse\@RapportFReqnarray}
\def\endRapportFReqnarray{\end@RapportFReqnarray}

\@namedef{RapportFReqnarray*}{\@RapportFReqnarraystarformtrue\@RapportFReqnarray}
\@namedef{endRapportFReqnarray*}{\end@RapportFReqnarray}


% \RapportFReqnarray is an enhanced \eqnarray. 
% The star form defaults to not putting equation numbers at the end of each row.
% usage: \RapportFReqnarray[decl]{cols}
\def\@RapportFReqnarray{\relax\@ifnextchar[{\@@RapportFReqnarray}{\@@RapportFReqnarray[\relax]}}
\def\@@RapportFReqnarray[#1]#2{%
   % default to showing the equation number or not based on whether or not
   % the star form was involked
   \if@RapportFReqnarraystarform\global\@eqnswfalse
   \else% not the star form
   \global\@eqnswtrue
   \fi% if star form
   \@RapportFRissubequationfalse% default to no subequations
   \@RapportFRlastlinewassubequationfalse% assume last line is not a sub equation
   \@RapportFReqnarrayISinnerfalse% not yet within the lines of the halign
   \@RapportFReqnarraystrutsize{0pt}{0pt}[\relax]% turn off struts by default
   \@RapportFReqnarrayusemasterstruttrue% use master strut till user asks otherwise
   \RapportFRvisiblestrutsfalse% diagnostic mode defaults to off
   % no extra space unless the user specifically requests it
   \lineskip=0pt\relax
   \lineskiplimit=0pt\relax
   \baselineskip=\normalbaselineskip\relax%
   \jot=\RapportFRnormaljot\relax%
   \mathsurround\z@\relax% no extra spacing around math
   \@advanceRapportFReqncolcnttrue% advance the col counter for each col the user uses, 
                             % used in \RapportFReqnarraymulticol and in the preamble build
   \stepcounter{equation}% advance equation counter before first line
   \setcounter{RapportFRsubequation}{0}% no subequation yet 
   \def\@currentlabel{\p@equation\theequation}% redefine the ref label
   \RapportFReqnarraydecl\relax% allow a way for the user to make global overrides
   #1\relax% allow user to override defaults
   \let\\\@RapportFReqnarraycr% replace newline with one that can put in eqn. numbers
   \global\@RapportFReqncolcnt\z@% col. count = 0 for first line
   \@RapportFRbuildpreamble #2\end\relax% build the preamble and put it into \@RapportFRtrantmptoksA 
   % put in the column for the equation number
   \ifnum\@RapportFReqnnumcols>0\relax\@RapportFRappendtoksA{&}\fi% col separator for those after the first
   \toks0={##}%
   % advance the \@RapportFReqncolcnt for the isolation col, this helps with error checking
   \@RapportFRappendtoksA{\global\advance\@RapportFReqncolcnt by 1\relax}%
   % add the isolation column
   \@RapportFRappendtoksA{\tabskip\z@skip\bgroup\the\toks0\egroup}%
   % advance the \@RapportFReqncolcnt for the equation number col, this helps with error checking
   \@RapportFRappendtoksA{&\global\advance\@RapportFReqncolcnt by 1\relax}%
   % add the equation number col to the preamble
   \@RapportFRappendtoksA{\tabskip\z@skip\hb@xt@\z@\bgroup\hss\the\toks0\egroup}%
   % note \@RapportFReqnnumcols does not count the equation col or isolation col
   % set the starting tabskip glue as determined by the preamble build
   \tabskip=\@RapportFRBPstartglue\relax
   % begin the display alignment
   \@RapportFReqnarrayISinnertrue% commands are now within the lines
   $$\everycr{}\halign to\displaywidth\bgroup
   % "exspand" the preamble
   \span\the\@RapportFRtrantmptoksA\cr}

% enter isolation/strut column (or the next column if the user did not use
% every column), record the strut status, complete the columns, do the strut if needed,
% restore counters to correct values and exit
\def\end@RapportFReqnarray{\@RapportFReqnarrayglobalizestrutstatus&\@@RapportFReqnarraycr\egroup%
\if@RapportFRlastlinewassubequation\global\advance\c@RapportFRsubequation\m@ne\fi%
\global\advance\c@equation\m@ne%
$$\@ignoretrue}

% need a way to remember if last line is a subequation
\newif\if@RapportFRlastlinewassubequation%
\@RapportFRlastlinewassubequationfalse

% RapportFReqnarray uses a modifed \\ instead of the plain \cr to
% end rows. This allows for things like \\*[vskip amount]
% This "cr" macros are modified versions those for LaTeX2e's eqnarray
% the {\ifnum0=`} braces must be kept away from the last column to avoid
% altering spacing of its math, so we use & to advance to the next column
% as there is an isolation/strut column after the user's columns
\def\@RapportFReqnarraycr{\@RapportFReqnarrayglobalizestrutstatus&% save strut status and advance to next column
   {\ifnum0=`}\fi
   \@ifstar{%
      \global\@eqpen\@M\@RapportFReqnarrayYCR
   }{%
      \global\@eqpen\interdisplaylinepenalty \@RapportFReqnarrayYCR
   }%
}

\def\@RapportFReqnarrayYCR{\@testopt\@RapportFReqnarrayXCR\z@skip}

\def\@RapportFReqnarrayXCR[#1]{%
   \ifnum0=`{\fi}%
   \@@RapportFReqnarraycr
   \noalign{\penalty\@eqpen\vskip\jot\vskip #1\relax}}%

\def\@@RapportFReqnarraycr{\@RapportFRtrantmptoksA={}% clear token register
    \advance\@RapportFReqncolcnt by -1\relax% adjust col count because of the isolation column
    \ifnum\@RapportFReqncolcnt>\@RapportFReqnnumcols\relax
    \@RapportFRclspkgerror{Too many columns within the RapportFReqnarray\MessageBreak
                          environment}%
    {Use fewer \string &'s or put more columns in the RapportFReqnarry column\MessageBreak 
     specifications.}\relax%
    \else
    \loop% add cols if the user did not use them all
    \ifnum\@RapportFReqncolcnt<\@RapportFReqnnumcols\relax
    \@RapportFRappendtoksA{&}%
    \advance\@RapportFReqncolcnt by 1\relax% update the col count
    \repeat
    % this number of &'s will take us the the isolation column
    \fi
    % execute the &'s
    \the\@RapportFRtrantmptoksA%
    % handle the strut/isolation column
    \@RapportFReqnarrayinsertstrut% do the strut if needed
    \@RapportFReqnarraystrutreset% reset the strut system for next line or RapportFReqnarray
    &% and enter the equation number column
    % is this line needs an equation number, display it and advance the
    % (sub)equation counters, record what type this line was
    \if@eqnsw%
     \if@RapportFRissubequation\theRapportFRsubequationdis\addtocounter{equation}{1}\stepcounter{RapportFRsubequation}%
     \global\@RapportFRlastlinewassubequationtrue%
     \else% display a standard equation number, initialize the RapportFRsubequation counter
     \theequationdis\stepcounter{equation}\setcounter{RapportFRsubequation}{0}%
     \global\@RapportFRlastlinewassubequationfalse\fi%
    \fi%
    % reset the eqnsw flag to indicate default preference of the display of equation numbers
    \if@RapportFReqnarraystarform\global\@eqnswfalse\else\global\@eqnswtrue\fi
    \global\@RapportFRissubequationfalse% reset the subequation flag
    % reset the number of columns the user actually used
    \global\@RapportFReqncolcnt\z@\relax
    % the real end of the line
    \cr}





% \RapportFReqnarraybox is like \RapportFReqnarray except the box form puts everything
% inside a vtop, vbox, or vcenter box depending on the letter in the second
% optional argument (t,b,c). Vbox is the default. Unlike \RapportFReqnarray,
% equation numbers are not displayed and \RapportFReqnarraybox can be nested.
% \RapportFReqnarrayboxm is for math mode (like \array) and does not put the vbox
% within an hbox.
% \RapportFReqnarrayboxt is for text mode (like \tabular) and puts the vbox within
% a \hbox{$ $} construct.
% \RapportFReqnarraybox will auto detect whether to use \RapportFReqnarrayboxm or 
% \RapportFReqnarrayboxt depending on the math mode.
% The third optional argument specifies the width this box is to be set to -
% natural width is the default.
% The * forms do not add \jot line spacing
% usage: \RapportFReqnarraybox[decl][pos][width]{cols}
\def\RapportFReqnarrayboxm{\@RapportFReqnarraystarformfalse\@RapportFReqnarrayboxHBOXSWfalse\@RapportFReqnarraybox}
\def\endRapportFReqnarrayboxm{\end@RapportFReqnarraybox}
\@namedef{RapportFReqnarrayboxm*}{\@RapportFReqnarraystarformtrue\@RapportFReqnarrayboxHBOXSWfalse\@RapportFReqnarraybox}
\@namedef{endRapportFReqnarrayboxm*}{\end@RapportFReqnarraybox}

\def\RapportFReqnarrayboxt{\@RapportFReqnarraystarformfalse\@RapportFReqnarrayboxHBOXSWtrue\@RapportFReqnarraybox}
\def\endRapportFReqnarrayboxt{\end@RapportFReqnarraybox}
\@namedef{RapportFReqnarrayboxt*}{\@RapportFReqnarraystarformtrue\@RapportFReqnarrayboxHBOXSWtrue\@RapportFReqnarraybox}
\@namedef{endRapportFReqnarrayboxt*}{\end@RapportFReqnarraybox}

\def\RapportFReqnarraybox{\@RapportFReqnarraystarformfalse\ifmmode\@RapportFReqnarrayboxHBOXSWfalse\else\@RapportFReqnarrayboxHBOXSWtrue\fi%
\@RapportFReqnarraybox}
\def\endRapportFReqnarraybox{\end@RapportFReqnarraybox}

\@namedef{RapportFReqnarraybox*}{\@RapportFReqnarraystarformtrue\ifmmode\@RapportFReqnarrayboxHBOXSWfalse\else\@RapportFReqnarrayboxHBOXSWtrue\fi%
\@RapportFReqnarraybox}
\@namedef{endRapportFReqnarraybox*}{\end@RapportFReqnarraybox}

% flag to indicate if the \RapportFReqnarraybox needs to put things into an hbox{$ $} 
% for \vcenter in non-math mode
\newif\if@RapportFReqnarrayboxHBOXSW%
\@RapportFReqnarrayboxHBOXSWfalse

\def\@RapportFReqnarraybox{\relax\@ifnextchar[{\@@RapportFReqnarraybox}{\@@RapportFReqnarraybox[\relax]}}
\def\@@RapportFReqnarraybox[#1]{\relax\@ifnextchar[{\@@@RapportFReqnarraybox[#1]}{\@@@RapportFReqnarraybox[#1][b]}}
\def\@@@RapportFReqnarraybox[#1][#2]{\relax\@ifnextchar[{\@@@@RapportFReqnarraybox[#1][#2]}{\@@@@RapportFReqnarraybox[#1][#2][\relax]}}

% #1 = decl; #2 = t,b,c; #3 = width, #4 = col specs
\def\@@@@RapportFReqnarraybox[#1][#2][#3]#4{\@RapportFReqnarrayISinnerfalse % not yet within the lines of the halign
   \@RapportFReqnarraymasterstrutsave% save current master strut values
   \@RapportFReqnarraystrutsize{0pt}{0pt}[\relax]% turn off struts by default
   \@RapportFReqnarrayusemasterstruttrue% use master strut till user asks otherwise
   \RapportFRvisiblestrutsfalse% diagnostic mode defaults to off
   % no extra space unless the user specifically requests it
   \lineskip=0pt\relax%
   \lineskiplimit=0pt\relax%
   \baselineskip=\normalbaselineskip\relax%
   \jot=\RapportFRnormaljot\relax%
   \mathsurround\z@\relax% no extra spacing around math
   % the default end glues are zero for an \RapportFReqnarraybox
   \edef\@RapportFReqnarraycolSEPdefaultstart{\@RapportFReqnarraycolSEPzero}% default start glue
   \edef\@RapportFReqnarraycolSEPdefaultend{\@RapportFReqnarraycolSEPzero}% default end glue
   \edef\@RapportFReqnarraycolSEPdefaultmid{\@RapportFReqnarraycolSEPzero}% default inter-column glue
   \@advanceRapportFReqncolcntfalse% do not advance the col counter for each col the user uses, 
                              % used in \RapportFReqnarraymulticol and in the preamble build
   \RapportFReqnarrayboxdecl\relax% allow a way for the user to make global overrides
   #1\relax% allow user to override defaults
   \let\\\@RapportFReqnarrayboxcr% replace newline with one that allows optional spacing
   \@RapportFRbuildpreamble #4\end\relax% build the preamble and put it into \@RapportFRtrantmptoksA
   % add an isolation column to the preamble to stop \\'s {} from getting into the last col
   \ifnum\@RapportFReqnnumcols>0\relax\@RapportFRappendtoksA{&}\fi% col separator for those after the first
   \toks0={##}%
   % add the isolation column to the preamble
   \@RapportFRappendtoksA{\tabskip\z@skip\bgroup\the\toks0\egroup}% 
   % set the starting tabskip glue as determined by the preamble build
   \tabskip=\@RapportFRBPstartglue\relax
   % begin the alignment
   \everycr{}%
   % use only the very first token to determine the positioning
   % this stops some problems when the user uses more than one letter,
   % but is probably not worth the effort
   % \noindent is used as a delimiter
   \def\@RapportFRgrabfirstoken##1##2\noindent{\let\@RapportFRgrabbedfirstoken=##1}%
   \@RapportFRgrabfirstoken#2\relax\relax\noindent
   % \@RapportFRgrabbedfirstoken has the first token, the rest are discarded
   % if we need to put things into and hbox and go into math mode, do so now
   \if@RapportFReqnarrayboxHBOXSW \leavevmode \hbox \bgroup $\fi%
   % use the appropriate vbox type
   \if\@RapportFRgrabbedfirstoken t\relax\vtop\else\if\@RapportFRgrabbedfirstoken c\relax%
   \vcenter\else\vbox\fi\fi\bgroup%
   \@RapportFReqnarrayISinnertrue% commands are now within the lines
   \ifx#3\relax\halign\else\halign to #3\relax\fi%
   \bgroup
   % "exspand" the preamble
   \span\the\@RapportFRtrantmptoksA\cr}

% carry strut status and enter the isolation/strut column, 
% exit from math mode if needed, and exit
\def\end@RapportFReqnarraybox{\@RapportFReqnarrayglobalizestrutstatus% carry strut status
&% enter isolation/strut column
\@RapportFReqnarrayinsertstrut% do strut if needed
\@RapportFReqnarraymasterstrutrestore% restore the previous master strut values
% reset the strut system for next RapportFReqnarray
% (sets local strut values back to previous master strut values)
\@RapportFReqnarraystrutreset%
% ensure last line, exit from halign, close vbox
\crcr\egroup\egroup%
% exit from math mode and close hbox if needed
\if@RapportFReqnarrayboxHBOXSW $\egroup\fi}



% RapportFReqnarraybox uses a modifed \\ instead of the plain \cr to
% end rows. This allows for things like \\[vskip amount]
% This "cr" macros are modified versions those for LaTeX2e's eqnarray
% For RapportFReqnarraybox, \\* is the same as \\
% the {\ifnum0=`} braces must be kept away from the last column to avoid
% altering spacing of its math, so we use & to advance to the isolation/strut column
% carry strut status into isolation/strut column
\def\@RapportFReqnarrayboxcr{\@RapportFReqnarrayglobalizestrutstatus% carry strut status
&% enter isolation/strut column
\@RapportFReqnarrayinsertstrut% do strut if needed
% reset the strut system for next line or RapportFReqnarray
\@RapportFReqnarraystrutreset%
{\ifnum0=`}\fi%
\@ifstar{\@RapportFReqnarrayboxYCR}{\@RapportFReqnarrayboxYCR}}

% test and setup the optional argument to \\[]
\def\@RapportFReqnarrayboxYCR{\@testopt\@RapportFReqnarrayboxXCR\z@skip}

% RapportFReqnarraybox does not automatically increase line spacing by \jot
\def\@RapportFReqnarrayboxXCR[#1]{\ifnum0=`{\fi}%
\cr\noalign{\if@RapportFReqnarraystarform\else\vskip\jot\fi\vskip#1\relax}}



% starts the halign preamble build
\def\@RapportFRbuildpreamble{\@RapportFRtrantmptoksA={}% clear token register
\let\@RapportFRBPcurtype=u%current column type is not yet known
\let\@RapportFRBPprevtype=s%the previous column type was the start
\let\@RapportFRBPnexttype=u%next column type is not yet known
% ensure these are valid
\def\@RapportFRBPcurglue={0pt plus 0pt minus 0pt}%
\def\@RapportFRBPcurcolname{@RapportFRdefault}% name of current column definition
% currently acquired numerically referenced glue
% use a name that is easier to remember
\let\@RapportFRBPcurnum=\@RapportFRtrantmpcountA%
\@RapportFRBPcurnum=0%
% tracks number of columns in the preamble
\@RapportFReqnnumcols=0%
% record the default end glues
\edef\@RapportFRBPstartglue{\@RapportFReqnarraycolSEPdefaultstart}%
\edef\@RapportFRBPendglue{\@RapportFReqnarraycolSEPdefaultend}%
% now parse the user's column specifications
\@@RapportFRbuildpreamble}


% parses and builds the halign preamble
\def\@@RapportFRbuildpreamble#1#2{\let\@@nextRapportFRbuildpreamble=\@@RapportFRbuildpreamble%
% use only the very first token to check the end
% \noindent is used as a delimiter as \end can be present here
\def\@RapportFRgrabfirstoken##1##2\noindent{\let\@RapportFRgrabbedfirstoken=##1}%
\@RapportFRgrabfirstoken#1\relax\relax\noindent
\ifx\@RapportFRgrabbedfirstoken\end\let\@@nextRapportFRbuildpreamble=\@@RapportFRfinishpreamble\else%
% identify current and next token type
\@RapportFRgetcoltype{#1}{\@RapportFRBPcurtype}{1}% current, error on invalid
\@RapportFRgetcoltype{#2}{\@RapportFRBPnexttype}{0}% next, no error on invalid next
% if curtype is a glue, get the glue def
\if\@RapportFRBPcurtype g\@RapportFRgetcurglue{#1}{\@RapportFRBPcurglue}\fi%
% if curtype is a column, get the column def and set the current column name
\if\@RapportFRBPcurtype c\@RapportFRgetcurcol{#1}\fi%
% if curtype is a numeral, acquire the user defined glue
\if\@RapportFRBPcurtype n\@RapportFRprocessNcol{#1}\fi%
% process the acquired glue 
\if\@RapportFRBPcurtype g\@RapportFRprocessGcol\fi%
% process the acquired col 
\if\@RapportFRBPcurtype c\@RapportFRprocessCcol\fi%
% ready prevtype for next col spec.
\let\@RapportFRBPprevtype=\@RapportFRBPcurtype%
% be sure and put back the future token(s) as a group
\fi\@@nextRapportFRbuildpreamble{#2}}


% executed just after preamble build is completed
% warn about zero cols, and if prevtype type = u, put in end tabskip glue
\def\@@RapportFRfinishpreamble#1{\ifnum\@RapportFReqnnumcols<1\relax
\@RapportFRclspkgerror{No column specifiers declared for RapportFReqnarray}%
{At least one column type must be declared for each RapportFReqnarray.}%
\fi%num cols less than 1
%if last type undefined, set default end tabskip glue
\if\@RapportFRBPprevtype u\@RapportFRappendtoksA{\tabskip=\@RapportFRBPendglue}\fi}


% Identify and return the column specifier's type code
\def\@RapportFRgetcoltype#1#2#3{%
% use only the very first token to determine the type
% \noindent is used as a delimiter as \end can be present here
\def\@RapportFRgrabfirstoken##1##2\noindent{\let\@RapportFRgrabbedfirstoken=##1}%
\@RapportFRgrabfirstoken#1\relax\relax\noindent
% \@RapportFRgrabfirstoken has the first token, the rest are discarded
% n = number
% g = glue (any other char in catagory 12)
% c = letter
% e = \end
% u = undefined
% third argument: 0 = no error message, 1 = error on invalid char
\let#2=u\relax% assume invalid until know otherwise
\ifx\@RapportFRgrabbedfirstoken\end\let#2=e\else
\ifcat\@RapportFRgrabbedfirstoken\relax\else% screen out control sequences
\if0\@RapportFRgrabbedfirstoken\let#2=n\else
\if1\@RapportFRgrabbedfirstoken\let#2=n\else
\if2\@RapportFRgrabbedfirstoken\let#2=n\else
\if3\@RapportFRgrabbedfirstoken\let#2=n\else
\if4\@RapportFRgrabbedfirstoken\let#2=n\else
\if5\@RapportFRgrabbedfirstoken\let#2=n\else
\if6\@RapportFRgrabbedfirstoken\let#2=n\else
\if7\@RapportFRgrabbedfirstoken\let#2=n\else
\if8\@RapportFRgrabbedfirstoken\let#2=n\else
\if9\@RapportFRgrabbedfirstoken\let#2=n\else
\ifcat,\@RapportFRgrabbedfirstoken\let#2=g\relax
\else\ifcat a\@RapportFRgrabbedfirstoken\let#2=c\relax\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
\if#2u\relax
\if0\noexpand#3\relax\else\@RapportFRclspkgerror{Invalid character in column specifications}%
{Only letters, numerals and certain other symbols are allowed \MessageBreak
as RapportFReqnarray column specifiers.}\fi\fi}


% identify the current letter referenced column
% if invalid, use a default column
\def\@RapportFRgetcurcol#1{\expandafter\ifx\csname @RapportFReqnarraycolDEF#1\endcsname\@RapportFReqnarraycolisdefined%
\def\@RapportFRBPcurcolname{#1}\else% invalid column name
\@RapportFRclspkgerror{Invalid column type "#1" in column specifications.\MessageBreak
Using a default centering column instead}%
{You must define RapportFReqnarray column types before use.}%
\def\@RapportFRBPcurcolname{@RapportFRdefault}\fi}


% identify and return the predefined (punctuation) glue value
\def\@RapportFRgetcurglue#1#2{%
% ! = \! (neg small)  -0.16667em (-3/18 em)
% , = \, (small)       0.16667em ( 3/18 em)
% : = \: (med)         0.22222em ( 4/18 em)
% ; = \; (large)       0.27778em ( 5/18 em)
% ' = \quad            1em
% " = \qquad           2em
% . = 0.5\arraycolsep
% / = \arraycolsep
% ? = 2\arraycolsep
% * = 1fil
% + = \@RapportFReqnarraycolSEPcenter
% - = \@RapportFReqnarraycolSEPzero
% Note that all em values are referenced to the math font (textfont2) fontdimen6
% value for 1em.
% 
% use only the very first token to determine the type
% this prevents errant tokens from getting in the main text
% \noindent is used as a delimiter here
\def\@RapportFRgrabfirstoken##1##2\noindent{\let\@RapportFRgrabbedfirstoken=##1}%
\@RapportFRgrabfirstoken#1\relax\relax\noindent
% get the math font 1em value
% LaTeX2e's NFSS2 does not preload the fonts, but \RapportFReqnarray needs
% to gain access to the math (\textfont2) font's spacing parameters.
% So we create a bogus box here that uses the math font to ensure
% that \textfont2 is loaded and ready. If this is not done,
% the \textfont2 stuff here may not work.
% Thanks to Bernd Raichle for his 1997 post on this topic.
{\setbox0=\hbox{$\displaystyle\relax$}}%
% fontdimen6 has the width of 1em (a quad).
\@RapportFRtrantmpdimenA=\fontdimen6\textfont2\relax%
% identify the glue value based on the first token
% we discard anything after the first
\if!\@RapportFRgrabbedfirstoken\@RapportFRtrantmpdimenA=-0.16667\@RapportFRtrantmpdimenA\edef#2{\the\@RapportFRtrantmpdimenA}\else
\if,\@RapportFRgrabbedfirstoken\@RapportFRtrantmpdimenA=0.16667\@RapportFRtrantmpdimenA\edef#2{\the\@RapportFRtrantmpdimenA}\else
\if:\@RapportFRgrabbedfirstoken\@RapportFRtrantmpdimenA=0.22222\@RapportFRtrantmpdimenA\edef#2{\the\@RapportFRtrantmpdimenA}\else
\if;\@RapportFRgrabbedfirstoken\@RapportFRtrantmpdimenA=0.27778\@RapportFRtrantmpdimenA\edef#2{\the\@RapportFRtrantmpdimenA}\else
\if'\@RapportFRgrabbedfirstoken\@RapportFRtrantmpdimenA=1\@RapportFRtrantmpdimenA\edef#2{\the\@RapportFRtrantmpdimenA}\else
\if"\@RapportFRgrabbedfirstoken\@RapportFRtrantmpdimenA=2\@RapportFRtrantmpdimenA\edef#2{\the\@RapportFRtrantmpdimenA}\else
\if.\@RapportFRgrabbedfirstoken\@RapportFRtrantmpdimenA=0.5\arraycolsep\edef#2{\the\@RapportFRtrantmpdimenA}\else
\if/\@RapportFRgrabbedfirstoken\edef#2{\the\arraycolsep}\else
\if?\@RapportFRgrabbedfirstoken\@RapportFRtrantmpdimenA=2\arraycolsep\edef#2{\the\@RapportFRtrantmpdimenA}\else
\if *\@RapportFRgrabbedfirstoken\edef#2{0pt plus 1fil minus 0pt}\else
\if+\@RapportFRgrabbedfirstoken\edef#2{\@RapportFReqnarraycolSEPcenter}\else
\if-\@RapportFRgrabbedfirstoken\edef#2{\@RapportFReqnarraycolSEPzero}\else
\edef#2{\@RapportFReqnarraycolSEPzero}%
\@RapportFRclspkgerror{Invalid predefined inter-column glue type "#1" in\MessageBreak
column specifications. Using a default value of\MessageBreak
0pt instead}%
{Only !,:;'"./?*+ and - are valid predefined glue types in the\MessageBreak 
RapportFReqnarray column specifications.}\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi}



% process a numerical digit from the column specification
% and look up the corresponding user defined glue value
% can transform current type from n to g or a as the user defined glue is acquired
\def\@RapportFRprocessNcol#1{\if\@RapportFRBPprevtype g%
\@RapportFRclspkgerror{Back-to-back inter-column glue specifiers in column\MessageBreak
specifications. Ignoring consecutive glue specifiers\MessageBreak
after the first}%
{You cannot have two or more glue types next to each other\MessageBreak 
in the RapportFReqnarray column specifications.}%
\let\@RapportFRBPcurtype=a% abort this glue, future digits will be discarded
\@RapportFRBPcurnum=0\relax%
\else% if we previously aborted a glue
\if\@RapportFRBPprevtype a\@RapportFRBPcurnum=0\let\@RapportFRBPcurtype=a%maintain digit abortion
\else%acquire this number
% save the previous type before the numerical digits started
\if\@RapportFRBPprevtype n\else\let\@RapportFRBPprevsavedtype=\@RapportFRBPprevtype\fi%
\multiply\@RapportFRBPcurnum by 10\relax%
\advance\@RapportFRBPcurnum by #1\relax% add in number, \relax is needed to stop TeX's number scan
\if\@RapportFRBPnexttype n\else%close acquisition
\expandafter\ifx\csname @RapportFReqnarraycolSEPDEF\expandafter\romannumeral\number\@RapportFRBPcurnum\endcsname\@RapportFReqnarraycolisdefined%
\edef\@RapportFRBPcurglue{\csname @RapportFReqnarraycolSEP\expandafter\romannumeral\number\@RapportFRBPcurnum\endcsname}%
\else%user glue not defined
\@RapportFRclspkgerror{Invalid user defined inter-column glue type "\number\@RapportFRBPcurnum" in\MessageBreak
column specifications. Using a default value of\MessageBreak
0pt instead}%
{You must define all RapportFReqnarray numerical inter-column glue types via\MessageBreak
\string\RapportFReqnarraydefcolsep \space before they are used in column specifications.}%
\edef\@RapportFRBPcurglue{\@RapportFReqnarraycolSEPzero}%
\fi% glue defined or not
\let\@RapportFRBPcurtype=g% change the type to reflect the acquired glue
\let\@RapportFRBPprevtype=\@RapportFRBPprevsavedtype% restore the prev type before this number glue
\@RapportFRBPcurnum=0\relax%ready for next acquisition
\fi%close acquisition, get glue
\fi%discard or acquire number
\fi%prevtype glue or not
}


% process an acquired glue
% add any acquired column/glue pair to the preamble
\def\@RapportFRprocessGcol{\if\@RapportFRBPprevtype a\let\@RapportFRBPcurtype=a%maintain previous glue abortions
\else
% if this is the start glue, save it, but do nothing else 
% as this is not used in the preamble, but before
\if\@RapportFRBPprevtype s\edef\@RapportFRBPstartglue{\@RapportFRBPcurglue}%
\else%not the start glue
\if\@RapportFRBPprevtype g%ignore if back to back glues
\@RapportFRclspkgerror{Back-to-back inter-column glue specifiers in column\MessageBreak
specifications. Ignoring consecutive glue specifiers\MessageBreak
after the first}%
{You cannot have two or more glue types next to each other\MessageBreak 
in the RapportFReqnarray column specifications.}%
\let\@RapportFRBPcurtype=a% abort this glue
\else% not a back to back glue
\if\@RapportFRBPprevtype c\relax% if the previoustype was a col, add column/glue pair to preamble
\ifnum\@RapportFReqnnumcols>0\relax\@RapportFRappendtoksA{&}\fi
\toks0={##}%
% make preamble advance col counter if this environment needs this
\if@advanceRapportFReqncolcnt\@RapportFRappendtoksA{\global\advance\@RapportFReqncolcnt by 1\relax}\fi
% insert the column defintion into the preamble, being careful not to expand
% the column definition
\@RapportFRappendtoksA{\tabskip=\@RapportFRBPcurglue}%
\@RapportFRappendNOEXPANDtoksA{\begingroup\csname @RapportFReqnarraycolPRE}%
\@RapportFRappendtoksA{\@RapportFRBPcurcolname}%
\@RapportFRappendNOEXPANDtoksA{\endcsname}%
\@RapportFRappendtoksA{\the\toks0}%
\@RapportFRappendNOEXPANDtoksA{\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\csname @RapportFReqnarraycolPOST}%
\@RapportFRappendtoksA{\@RapportFRBPcurcolname}%
\@RapportFRappendNOEXPANDtoksA{\endcsname\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\endgroup}%
\advance\@RapportFReqnnumcols by 1\relax%one more column in the preamble
\else% error: non-start glue with no pending column
\@RapportFRclspkgerror{Inter-column glue specifier without a prior column\MessageBreak
type in the column specifications. Ignoring this glue\MessageBreak 
specifier}%
{Except for the first and last positions, glue can be placed only\MessageBreak
between column types.}%
\let\@RapportFRBPcurtype=a% abort this glue
\fi% previous was a column
\fi% back-to-back glues
\fi% is start column glue
\fi% prev type not a
}


% process an acquired letter referenced column and, if necessary, add it to the preamble
\def\@RapportFRprocessCcol{\if\@RapportFRBPnexttype g\else
\if\@RapportFRBPnexttype n\else
% we have a column followed by something other than a glue (or numeral glue)
% so we must add this column to the preamble now
\ifnum\@RapportFReqnnumcols>0\relax\@RapportFRappendtoksA{&}\fi%col separator for those after the first
\if\@RapportFRBPnexttype e\@RapportFRappendtoksA{\tabskip=\@RapportFRBPendglue\relax}\else%put in end glue
\@RapportFRappendtoksA{\tabskip=\@RapportFReqnarraycolSEPdefaultmid\relax}\fi% or default mid glue
\toks0={##}%
% make preamble advance col counter if this environment needs this
\if@advanceRapportFReqncolcnt\@RapportFRappendtoksA{\global\advance\@RapportFReqncolcnt by 1\relax}\fi
% insert the column definition into the preamble, being careful not to expand
% the column definition
\@RapportFRappendNOEXPANDtoksA{\begingroup\csname @RapportFReqnarraycolPRE}%
\@RapportFRappendtoksA{\@RapportFRBPcurcolname}%
\@RapportFRappendNOEXPANDtoksA{\endcsname}%
\@RapportFRappendtoksA{\the\toks0}%
\@RapportFRappendNOEXPANDtoksA{\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\csname @RapportFReqnarraycolPOST}%
\@RapportFRappendtoksA{\@RapportFRBPcurcolname}%
\@RapportFRappendNOEXPANDtoksA{\endcsname\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\endgroup}%
\advance\@RapportFReqnnumcols by 1\relax%one more column in the preamble
\fi%next type not numeral
\fi%next type not glue
}


%%
%% END OF RapportFReqnarry DEFINITIONS
%%




% set up the running headings, this complex because of all the different
% modes RapportFRtran supports
\if@twoside
 \ifCLASSOPTIONtechnote
   \def\ps@headings{%
       \def\@oddhead{\hbox{}\scriptsize\leftmark \hfil \thepage}
       \def\@evenhead{\scriptsize\thepage \hfil \leftmark\hbox{}}
       \ifCLASSOPTIONdraftcls
            \ifCLASSOPTIONdraftclsnofoot
               \def\@oddfoot{}\def\@evenfoot{}%
            \else
               \def\@oddfoot{\scriptsize\@date\hfil DRAFT}
               \def\@evenfoot{\scriptsize DRAFT\hfil\@date}
            \fi
       \else
            \def\@oddfoot{}\def\@evenfoot{}
       \fi}
 \else % not a technote
   \def\ps@headings{%
       \ifCLASSOPTIONconference
        \def\@oddhead{}
        \def\@evenhead{}
       \else
        \def\@oddhead{\hbox{}\scriptsize\rightmark \hfil \thepage}
        \def\@evenhead{\scriptsize\thepage \hfil \leftmark\hbox{}}
       \fi
       \ifCLASSOPTIONdraftcls
            \def\@oddhead{\hbox{}\scriptsize\rightmark \hfil \thepage}
            \def\@evenhead{\scriptsize\thepage \hfil \leftmark\hbox{}}
            \ifCLASSOPTIONdraftclsnofoot
               \def\@oddfoot{}\def\@evenfoot{}%
            \else
               \def\@oddfoot{\scriptsize\@date\hfil DRAFT}
               \def\@evenfoot{\scriptsize DRAFT\hfil\@date}
            \fi
       \else
            \def\@oddfoot{}\def\@evenfoot{}%
       \fi}
 \fi
\else % single side
\def\ps@headings{%
    \ifCLASSOPTIONconference
     \def\@oddhead{}
     \def\@evenhead{}
    \else
     \def\@oddhead{\hbox{}\scriptsize\leftmark \hfil \thepage}
     \def\@evenhead{}
    \fi
    \ifCLASSOPTIONdraftcls
          \def\@oddhead{\hbox{}\scriptsize\leftmark \hfil \thepage}
          \def\@evenhead{}
          \ifCLASSOPTIONdraftclsnofoot
             \def\@oddfoot{}
          \else
             \def\@oddfoot{\scriptsize \@date \hfil DRAFT}
          \fi
    \else
         \def\@oddfoot{}
    \fi
    \def\@evenfoot{}}
\fi


% title page style
\def\ps@RapportFRtitlepagestyle{\def\@oddfoot{}\def\@evenfoot{}%
\ifCLASSOPTIONconference
   \def\@oddhead{}%
   \def\@evenhead{}%
\else
   \def\@oddhead{\hbox{}\scriptsize\leftmark \hfil \thepage}%
   \def\@evenhead{\scriptsize\thepage \hfil \leftmark\hbox{}}%
\fi
\ifCLASSOPTIONdraftcls
   \def\@oddhead{\hbox{}\scriptsize\leftmark \hfil \thepage}%
   \def\@evenhead{\scriptsize\thepage \hfil \leftmark\hbox{}}%
   \ifCLASSOPTIONdraftclsnofoot\else
      \def\@oddfoot{\scriptsize \@date\hfil DRAFT}%
      \def\@evenfoot{\scriptsize DRAFT\hfil \@date}%
   \fi
\else
   % all non-draft mode footers
   \if@RapportFRusingpubid
      % for title pages that are using a pubid
      % do not repeat pubid if using peer review option
      \ifCLASSOPTIONpeerreview
      \else
         \footskip 0pt%
         \ifCLASSOPTIONcompsoc
           \def\@oddfoot{\hss\normalfont\scriptsize\raisebox{-1.5\@RapportFRnormalsizeunitybaselineskip}[0ex][0ex]{\@RapportFRpubid}\hss}%
           \def\@evenfoot{\hss\normalfont\scriptsize\raisebox{-1.5\@RapportFRnormalsizeunitybaselineskip}[0ex][0ex]{\@RapportFRpubid}\hss}%
         \else
           \def\@oddfoot{\hss\normalfont\footnotesize\raisebox{1.5ex}[1.5ex]{\@RapportFRpubid}\hss}%
           \def\@evenfoot{\hss\normalfont\footnotesize\raisebox{1.5ex}[1.5ex]{\@RapportFRpubid}\hss}%
         \fi
      \fi
   \fi
\fi}


% peer review cover page style
\def\ps@RapportFRpeerreviewcoverpagestyle{%
\def\@oddhead{}\def\@evenhead{}%
\def\@oddfoot{}\def\@evenfoot{}%
\ifCLASSOPTIONdraftcls
   \ifCLASSOPTIONdraftclsnofoot\else
      \def\@oddfoot{\scriptsize \@date\hfil DRAFT}%
      \def\@evenfoot{\scriptsize DRAFT\hfil \@date}%
   \fi
\else
   % non-draft mode footers
   \if@RapportFRusingpubid
      \footskip 0pt%
      \ifCLASSOPTIONcompsoc
        \def\@oddfoot{\hss\normalfont\scriptsize\raisebox{-1.5\@RapportFRnormalsizeunitybaselineskip}[0ex][0ex]{\@RapportFRpubid}\hss}%
        \def\@evenfoot{\hss\normalfont\scriptsize\raisebox{-1.5\@RapportFRnormalsizeunitybaselineskip}[0ex][0ex]{\@RapportFRpubid}\hss}%
      \else
        \def\@oddfoot{\hss\normalfont\footnotesize\raisebox{1.5ex}[1.5ex]{\@RapportFRpubid}\hss}%
        \def\@evenfoot{\hss\normalfont\footnotesize\raisebox{1.5ex}[1.5ex]{\@RapportFRpubid}\hss}%
      \fi
   \fi
\fi}


% start with empty headings
\def\rightmark{}\def\leftmark{}


%% Defines the command for putting the header. \footernote{TEXT} is the same
%% as \markboth{TEXT}{TEXT}. 
%% Note that all the text is forced into uppercase, if you have some text
%% that needs to be in lower case, for instance et. al., then either manually
%% set \leftmark and \rightmark or use \MakeLowercase{et. al.} within the
%% arguments to \markboth.
\def\markboth#1#2{\def\leftmark{\@RapportFRcompsoconly{\sffamily}\MakeUppercase{#1}}%
\def\rightmark{\@RapportFRcompsoconly{\sffamily}\MakeUppercase{#2}}}
\def\footernote#1{\markboth{#1}{#1}}

\def\today{\ifcase\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
    \space\number\day, \number\year}




%% CITATION AND BIBLIOGRAPHY COMMANDS
%% 
%% V1.6 no longer supports the older, nonstandard \shortcite and \citename setup stuff
% 
% 
% Modify Latex2e \@citex to separate citations with "], ["
\def\@citex[#1]#2{%
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{], [}%
     \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
       \G@refundefinedtrue
       \@latex@warning
         {Citation `\@citeb' on page \thepage \space undefined}}%
       {\hbox{\csname b@\@citeb\endcsname}}}}{#1}}

% V1.6 we create hooks for the optional use of Donald Arseneau's
% cite.sty package. cite.sty is "smart" and will notice that the
% following format controls are already defined and will not
% redefine them. The result will be the proper sorting of the
% citation numbers and auto detection of 3 or more entry "ranges" -
% all in RapportFR style:  [1], [2], [5]--[7], [12]
% This also allows for an optional note, i.e., \cite[mynote]{..}.
% If the \cite with note has more than one reference, the note will
% be applied to the last of the listed references. It is generally
% desired that if a note is given, only one reference is listed in
% that \cite.
% Thanks to Mr. Arseneau for providing the required format arguments
% to produce the RapportFR style.
\def\citepunct{], [}
\def\citedash{]--[}

% V1.7 default to using same font for urls made by url.sty
\AtBeginDocument{\csname url@samestyle\endcsname}

% V1.6 class files should always provide these
\def\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty


% Provide support for the control entries of RapportFRtran.bst V1.00 and later.
% V1.7 optional argument allows for a different aux file to be specified in
% order to handle multiple bibliographies. For example, with multibib.sty:
% \newcites{sec}{Secondary Literature}
% \bstctlcite[@auxoutsec]{BSTcontrolhak}
\def\bstctlcite{\@ifnextchar[{\@bstctlcite}{\@bstctlcite[@auxout]}}
\def\@bstctlcite[#1]#2{\@bsphack
  \@for\@citeb:=#2\do{%
    \edef\@citeb{\expandafter\@firstofone\@citeb}%
    \if@filesw\immediate\write\csname #1\endcsname{\string\citation{\@citeb}}\fi}%
  \@esphack}

% V1.6 provide a way for a user to execute a command just before 
% a given reference number - used to insert a \newpage to balance
% the columns on the last page
\edef\@RapportFRtriggerrefnum{0}   % the default of zero means that
                              % the command is not executed
\def\@RapportFRtriggercmd{\newpage}

% allow the user to alter the triggered command
\long\def\RapportFRtriggercmd#1{\long\def\@RapportFRtriggercmd{#1}}

% allow user a way to specify the reference number just before the
% command is executed
\def\RapportFRtriggeratref#1{\@RapportFRtrantmpcountA=#1%
\edef\@RapportFRtriggerrefnum{\the\@RapportFRtrantmpcountA}}%

% trigger command at the given reference
\def\@RapportFRbibitemprefix{\@RapportFRtrantmpcountA=\@RapportFRtriggerrefnum\relax%
\advance\@RapportFRtrantmpcountA by -1\relax%
\ifnum\c@enumiv=\@RapportFRtrantmpcountA\relax\@RapportFRtriggercmd\relax\fi}


\def\@biblabel#1{[#1]}

% compsoc journals left align the reference numbers
\@RapportFRcompsocnotconfonly{\def\@biblabel#1{[#1]\hfill}}

% controls bib item spacing
\def\RapportFRbibitemsep{0pt plus .5pt}

\@RapportFRcompsocconfonly{\def\RapportFRbibitemsep{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}}


\def\thebibliography#1{\section*{\refname}%
    \addcontentsline{toc}{section}{\refname}%
    % V1.6 add some rubber space here and provide a command trigger
    \footnotesize\@RapportFRcompsocconfonly{\small}\vskip 0.3\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip%
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep\relax
    \itemsep \RapportFRbibitemsep\relax
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \let\@RapportFRlatexbibitem\bibitem%
    \def\bibitem{\@RapportFRbibitemprefix\@RapportFRlatexbibitem}%
\def\newblock{\hskip .11em plus .33em minus .07em}%
% originally:
%   \sloppy\clubpenalty4000\widowpenalty4000%
% by adding the \interlinepenalty here, we make it more
% difficult, but not impossible, for LaTeX to break within a reference.
% RapportFR almost never breaks a reference (but they do it more often with
% technotes). You may get an underfull vbox warning around the bibliography, 
% but the final result will be much more like what RapportFR will publish. 
% MDS 11/2000
\ifCLASSOPTIONtechnote\sloppy\clubpenalty4000\widowpenalty4000\interlinepenalty100%
\else\sloppy\clubpenalty4000\widowpenalty4000\interlinepenalty500\fi%
    \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist




% TITLE PAGE COMMANDS
% 
% 
% \RapportFRmembership is used to produce the sublargesize italic font used to indicate author 
% RapportFR membership. compsoc uses a large size sans slant font
\def\RapportFRmembership#1{{\@RapportFRnotcompsoconly{\sublargesize}\normalfont\@RapportFRcompsoconly{\sffamily}\textit{#1}}}
 

% \RapportFRauthorrefmark{} produces a footnote type symbol to indicate author affiliation.
% When given an argument of 1 to 9, \RapportFRauthorrefmark{} follows the standard LaTeX footnote
% symbol sequence convention. However, for arguments 10 and above, \RapportFRauthorrefmark{} 
% reverts to using lower case roman numerals, so it cannot overflow. Do note that you 
% cannot use \footnotemark[] in place of \RapportFRauthorrefmark{} within \author as the footnote
% symbols will have been turned off to prevent \thanks from creating footnote marks.
% \RapportFRauthorrefmark{} produces a symbol that appears to LaTeX as having zero vertical
% height - this allows for a more compact line packing, but the user must ensure that
% the interline spacing is large enough to prevent \RapportFRauthorrefmark{} from colliding
% with the text above.
% V1.7 make this a robust command
\DeclareRobustCommand*{\RapportFRauthorrefmark}[1]{\raisebox{0pt}[0pt][0pt]{\textsuperscript{\footnotesize\ensuremath{\ifcase#1\or *\or \dagger\or \ddagger\or%
    \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger%
    \or \ddagger\ddagger \else\textsuperscript{\expandafter\romannumeral#1}\fi}}}}


% FONT CONTROLS AND SPACINGS FOR CONFERENCE MODE AUTHOR NAME AND AFFILIATION BLOCKS
% 
% The default font styles for the author name and affiliation blocks (confmode)
\def\@RapportFRauthorblockNstyle{\normalfont\@RapportFRcompsocnotconfonly{\sffamily}\sublargesize\@RapportFRcompsocconfonly{\large}}
\def\@RapportFRauthorblockAstyle{\normalfont\@RapportFRcompsocnotconfonly{\sffamily}\@RapportFRcompsocconfonly{\itshape}\normalsize\@RapportFRcompsocconfonly{\large}}
% The default if the user does not use an author block
\def\@RapportFRauthordefaulttextstyle{\normalfont\@RapportFRcompsocnotconfonly{\sffamily}\sublargesize}

% spacing from title (or special paper notice) to author name blocks (confmode)
% can be negative
\def\@RapportFRauthorblockconfadjspace{-0.25em}
% compsoc conferences need more space here
\@RapportFRcompsocconfonly{\def\@RapportFRauthorblockconfadjspace{0.75\@RapportFRnormalsizeunitybaselineskip}}

% spacing between name and affiliation blocks (confmode)
% This can be negative.
% RapportFR doesn't want any added spacing here, but I will leave these
% controls in place in case they ever change their mind.
% Personally, I like 0.75ex.
%\def\@RapportFRauthorblockNtopspace{0.75ex}
%\def\@RapportFRauthorblockAtopspace{0.75ex}
\def\@RapportFRauthorblockNtopspace{0.0ex}
\def\@RapportFRauthorblockAtopspace{0.0ex}
% baseline spacing within name and affiliation blocks (confmode)
% must be positive, spacings below certain values will make 
% the position of line of text sensitive to the contents of the
% line above it i.e., whether or not the prior line has descenders, 
% subscripts, etc. For this reason it is a good idea to keep
% these above 2.6ex
\def\@RapportFRauthorblockNinterlinespace{2.6ex}
\def\@RapportFRauthorblockAinterlinespace{2.75ex}

% This tracks the required strut size.
% See the \@RapportFRauthorhalign command for the actual default value used.
\def\@RapportFRauthorblockXinterlinespace{2.7ex}

% variables to retain font size and style across groups
% values given here have no effect as they will be overwritten later
\gdef\@RapportFRSAVESTATEfontsize{10}
\gdef\@RapportFRSAVESTATEfontbaselineskip{12}
\gdef\@RapportFRSAVESTATEfontencoding{OT1}
\gdef\@RapportFRSAVESTATEfontfamily{ptm}
\gdef\@RapportFRSAVESTATEfontseries{m}
\gdef\@RapportFRSAVESTATEfontshape{n}

% saves the current font attributes
\def\@RapportFRcurfontSAVE{\global\let\@RapportFRSAVESTATEfontsize\f@size%
\global\let\@RapportFRSAVESTATEfontbaselineskip\f@baselineskip%
\global\let\@RapportFRSAVESTATEfontencoding\f@encoding%
\global\let\@RapportFRSAVESTATEfontfamily\f@family%
\global\let\@RapportFRSAVESTATEfontseries\f@series%
\global\let\@RapportFRSAVESTATEfontshape\f@shape}

% restores the saved font attributes
\def\@RapportFRcurfontRESTORE{\fontsize{\@RapportFRSAVESTATEfontsize}{\@RapportFRSAVESTATEfontbaselineskip}%
\fontencoding{\@RapportFRSAVESTATEfontencoding}%
\fontfamily{\@RapportFRSAVESTATEfontfamily}%
\fontseries{\@RapportFRSAVESTATEfontseries}%
\fontshape{\@RapportFRSAVESTATEfontshape}%
\selectfont}


% variable to indicate if the current block is the first block in the column
\newif\if@RapportFRprevauthorblockincol   \@RapportFRprevauthorblockincolfalse


% the command places a strut with height and depth = \@RapportFRauthorblockXinterlinespace
% we use this technique to have complete manual control over the spacing of the lines
% within the halign environment.
% We set the below baseline portion at 30%, the above
% baseline portion at 70% of the total length.
% Responds to changes in the document's \baselinestretch
\def\@RapportFRauthorstrutrule{\@RapportFRtrantmpdimenA\@RapportFRauthorblockXinterlinespace%
\@RapportFRtrantmpdimenA=\baselinestretch\@RapportFRtrantmpdimenA%
\rule[-0.3\@RapportFRtrantmpdimenA]{0pt}{\@RapportFRtrantmpdimenA}}


% blocks to hold the authors' names and affilations. 
% Makes formatting easy for conferences
%
% use real definitions in conference mode
% name block
\def\RapportFRauthorblockN#1{\relax\@RapportFRauthorblockNstyle% set the default text style
\gdef\@RapportFRauthorblockXinterlinespace{0pt}% disable strut for spacer row
% the \expandafter hides the \cr in conditional tex, see the array.sty docs
% for details, probably not needed here as the \cr is in a macro
% do a spacer row if needed
\if@RapportFRprevauthorblockincol\expandafter\@RapportFRauthorblockNtopspaceline\fi
\global\@RapportFRprevauthorblockincoltrue% we now have a block in this column
%restore the correct strut value
\gdef\@RapportFRauthorblockXinterlinespace{\@RapportFRauthorblockNinterlinespace}%
% input the author names
#1%
% end the row if the user did not already
\crcr}
% spacer row for names
\def\@RapportFRauthorblockNtopspaceline{\cr\noalign{\vskip\@RapportFRauthorblockNtopspace}}
%
% affiliation block
\def\RapportFRauthorblockA#1{\relax\@RapportFRauthorblockAstyle% set the default text style
\gdef\@RapportFRauthorblockXinterlinespace{0pt}%disable strut for spacer row
% the \expandafter hides the \cr in conditional tex, see the array.sty docs
% for details, probably not needed here as the \cr is in a macro
% do a spacer row if needed
\if@RapportFRprevauthorblockincol\expandafter\@RapportFRauthorblockAtopspaceline\fi
\global\@RapportFRprevauthorblockincoltrue% we now have a block in this column
%restore the correct strut value
\gdef\@RapportFRauthorblockXinterlinespace{\@RapportFRauthorblockAinterlinespace}%
% input the author affiliations
#1%
% end the row if the user did not already
\crcr}
% spacer row for affiliations
\def\@RapportFRauthorblockAtopspaceline{\cr\noalign{\vskip\@RapportFRauthorblockAtopspace}}


% allow papers to compile even if author blocks are used in modes other
% than conference or peerreviewca. For such cases, we provide dummy blocks.
\ifCLASSOPTIONconference
\else
   \ifCLASSOPTIONpeerreviewca\else
      % not conference or peerreviewca mode
      \def\RapportFRauthorblockN#1{#1}%
      \def\RapportFRauthorblockA#1{#1}%
   \fi
\fi



% we provide our own halign so as not to have to depend on tabular
\def\@RapportFRauthorhalign{\@RapportFRauthordefaulttextstyle% default text style
   \lineskip=0pt\relax% disable line spacing
   \lineskiplimit=0pt\relax%
   \baselineskip=0pt\relax%
   \@RapportFRcurfontSAVE% save the current font
   \mathsurround\z@\relax% no extra spacing around math
   \let\\\@RapportFRauthorhaligncr% replace newline with halign friendly one
   \tabskip=0pt\relax% no column spacing
   \everycr{}% ensure no problems here
   \@RapportFRprevauthorblockincolfalse% no author blocks yet
   \def\@RapportFRauthorblockXinterlinespace{2.7ex}% default interline space
   \vtop\bgroup%vtop box
   \halign\bgroup&\relax\hfil\@RapportFRcurfontRESTORE\relax ##\relax
   \hfil\@RapportFRcurfontSAVE\@RapportFRauthorstrutrule\cr}

% ensure last line, exit from halign, close vbox
\def\end@RapportFRauthorhalign{\crcr\egroup\egroup}

% handle bogus star form
\def\@RapportFRauthorhaligncr{{\ifnum0=`}\fi\@ifstar{\@@RapportFRauthorhaligncr}{\@@RapportFRauthorhaligncr}}

% test and setup the optional argument to \\[]
\def\@@RapportFRauthorhaligncr{\@testopt\@@@RapportFRauthorhaligncr\z@skip}

% end the line and do the optional spacer
\def\@@@RapportFRauthorhaligncr[#1]{\ifnum0=`{\fi}\cr\noalign{\vskip#1\relax}}



% flag to prevent multiple \and warning messages
\newif\if@RapportFRWARNand
\@RapportFRWARNandtrue

% if in conference or peerreviewca modes, we support the use of \and as \author is a
% tabular environment, otherwise we warn the user that \and is invalid
% outside of conference or peerreviewca modes.
\def\and{\relax} % provide a bogus \and that we will then override

\renewcommand{\and}[1][\relax]{\if@RapportFRWARNand\typeout{** WARNING: \noexpand\and is valid only
                               when in conference or peerreviewca}\typeout{modes (line \the\inputlineno).}\fi\global\@RapportFRWARNandfalse}

\ifCLASSOPTIONconference%
\renewcommand{\and}[1][\hfill]{\end{@RapportFRauthorhalign}#1\begin{@RapportFRauthorhalign}}%
\fi
\ifCLASSOPTIONpeerreviewca
\renewcommand{\and}[1][\hfill]{\end{@RapportFRauthorhalign}#1\begin{@RapportFRauthorhalign}}%
\fi


% page clearing command
% based on LaTeX2e's \cleardoublepage, but allows different page styles
% for the inserted blank pages
\def\@RapportFRcleardoublepage#1{\clearpage\if@twoside\ifodd\c@page\else
\hbox{}\thispagestyle{#1}\newpage\if@twocolumn\hbox{}\thispagestyle{#1}\newpage\fi\fi\fi}


% user command to invoke the title page
\def\maketitle{\par%
  \begingroup%
  \normalfont%
  \def\thefootnote{}%  the \thanks{} mark type is empty
  \def\footnotemark{}% and kill space from \thanks within author
  \let\@makefnmark\relax% V1.7, must *really* kill footnotemark to remove all \textsuperscript spacing as well.
  \footnotesize%       equal spacing between thanks lines
  \footnotesep 0.7\baselineskip%see global setting of \footnotesep for more info
  % V1.7 disable \thanks note indention for compsoc
  \@RapportFRcompsoconly{\long\def\@makefntext##1{\parindent 1em\noindent\hbox{\@makefnmark}##1}}%
  \normalsize%
  \ifCLASSOPTIONpeerreview
     \newpage\global\@topnum\z@ \@maketitle\@RapportFRstatictitlevskip\@RapportFRaftertitletext%
     \thispagestyle{RapportFRpeerreviewcoverpagestyle}\@thanks%
  \else
     \if@twocolumn%
        \ifCLASSOPTIONtechnote%
           \newpage\global\@topnum\z@ \@maketitle\@RapportFRstatictitlevskip\@RapportFRaftertitletext%
        \else
           \twocolumn[\@maketitle\@RapportFRdynamictitlevspace\@RapportFRaftertitletext]%
        \fi
     \else
        \newpage\global\@topnum\z@ \@maketitle\@RapportFRstatictitlevskip\@RapportFRaftertitletext%
     \fi
     \thispagestyle{RapportFRtitlepagestyle}\@thanks%
  \fi
  % pullup page for pubid if used.
  \if@RapportFRusingpubid
     \enlargethispage{-\@RapportFRpubidpullup}%
  \fi 
  \endgroup
  \setcounter{footnote}{0}\let\maketitle\relax\let\@maketitle\relax
  \gdef\@thanks{}%
  % v1.6b do not clear these as we will need the title again for peer review papers
  % \gdef\@author{}\gdef\@title{}%
  \let\thanks\relax}



% V1.7 parbox to format \@RapportFRcompsoctitleabstractindextext
\long\def\@RapportFRcompsoctitleabstractindextextbox#1{\parbox{0.915\textwidth}{#1}}

% formats the Title, authors names, affiliations and special paper notice
% THIS IS A CONTROLLED SPACING COMMAND! Do not allow blank lines or unintentional
% spaces to enter the definition - use % at the end of each line
\def\@maketitle{\newpage
\begin{center}%
\ifCLASSOPTIONtechnote% technotes
   {\bfseries\large\@RapportFRcompsoconly{\sffamily}\@title\par}\vskip 1.3em{\lineskip .5em\@RapportFRcompsoconly{\sffamily}\@author
   \@RapportFRspecialpapernotice\par{\@RapportFRcompsoconly{\vskip 1.5em\relax
   \@RapportFRcompsoctitleabstractindextextbox{\@RapportFRcompsoctitleabstractindextext}\par
   \hfill\@RapportFRcompsocdiamondline\hfill\hbox{}\par}}}\relax
\else% not a technote
   \vskip0.2em{\Huge\@RapportFRcompsoconly{\sffamily}\@RapportFRcompsocconfonly{\normalfont\normalsize\vskip 2\@RapportFRnormalsizeunitybaselineskip
   \bfseries\Large}\@title\par}\vskip1.0em\par%
   % V1.6 handle \author differently if in conference mode
   \ifCLASSOPTIONconference%
      {\@RapportFRspecialpapernotice\mbox{}\vskip\@RapportFRauthorblockconfadjspace%
       \mbox{}\hfill\begin{@RapportFRauthorhalign}\@author\end{@RapportFRauthorhalign}\hfill\mbox{}\par}\relax
   \else% peerreviewca, peerreview or journal
      \ifCLASSOPTIONpeerreviewca
         % peerreviewca handles author names just like conference mode
         {\@RapportFRcompsoconly{\sffamily}\@RapportFRspecialpapernotice\mbox{}\vskip\@RapportFRauthorblockconfadjspace%
          \mbox{}\hfill\begin{@RapportFRauthorhalign}\@author\end{@RapportFRauthorhalign}\hfill\mbox{}\par
          {\@RapportFRcompsoconly{\vskip 1.5em\relax
           \@RapportFRcompsoctitleabstractindextextbox{\@RapportFRcompsoctitleabstractindextext}\par\hfill
           \@RapportFRcompsocdiamondline\hfill\hbox{}\par}}}\relax
      \else% journal or peerreview
         {\lineskip.5em\@RapportFRcompsoconly{\sffamily}\sublargesize\@author\@RapportFRspecialpapernotice\par
          {\@RapportFRcompsoconly{\vskip 1.5em\relax
           \@RapportFRcompsoctitleabstractindextextbox{\@RapportFRcompsoctitleabstractindextext}\par\hfill
           \@RapportFRcompsocdiamondline\hfill\hbox{}\par}}}\relax
      \fi
   \fi
\fi\end{center}}



% V1.7 Computer Society "diamond line" which follows index terms for nonconference papers
\def\@RapportFRcompsocdiamondline{\vrule depth 0pt height 0.5pt width 4cm\hspace{7.5pt}%
\raisebox{-3.5pt}{\fontfamily{pzd}\fontencoding{U}\fontseries{m}\fontshape{n}\fontsize{11}{12}\selectfont\char70}%
\hspace{7.5pt}\vrule depth 0pt height 0.5pt width 4cm\relax}

% V1.7 standard LateX2e \thanks, but with \itshape under compsoc. Also make it a \long\def
% We also need to trigger the one-shot footnote rule
\def\@RapportFRtriggeroneshotfootnoterule{\global\@RapportFRenableoneshotfootnoteruletrue}


\long\def\thanks#1{\footnotemark
    \protected@xdef\@thanks{\@thanks
        \protect\footnotetext[\the\c@footnote]{\@RapportFRcompsoconly{\itshape
        \protect\@RapportFRtriggeroneshotfootnoterule\relax}\ignorespaces#1}}}
\let\@thanks\@empty

% V1.7 allow \author to contain \par's. This is needed to allow \thanks to contain \par.
\long\def\author#1{\gdef\@author{#1}}


% in addition to setting up RapportFRitemize, we need to remove a baselineskip space above and
% below it because \list's \pars introduce blank lines because of the footnote struts.
\def\@RapportFRsetupcompsocitemizelist{\def\labelitemi{$\bullet$}%
\setlength{\RapportFRlabelindent}{0pt}\setlength{\parskip}{0pt}%
\setlength{\partopsep}{0pt}\setlength{\topsep}{0.5\baselineskip}\vspace{-1\baselineskip}\relax}


% flag for fake non-compsoc \RapportFRcompsocthanksitem - prevents line break on very first item
\newif\if@RapportFRbreakcompsocthanksitem \@RapportFRbreakcompsocthanksitemfalse

\ifCLASSOPTIONcompsoc
% V1.7 compsoc bullet item \thanks
% also, we need to redefine this to destroy the argument in \@RapportFRdynamictitlevspace
\long\def\RapportFRcompsocitemizethanks#1{\relax\@RapportFRbreakcompsocthanksitemfalse\footnotemark
    \protected@xdef\@thanks{\@thanks
        \protect\footnotetext[\the\c@footnote]{\itshape\protect\@RapportFRtriggeroneshotfootnoterule
        {\let\RapportFRiedlistdecl\relax\protect\begin{RapportFRitemize}[\protect\@RapportFRsetupcompsocitemizelist]\ignorespaces#1\relax
        \protect\end{RapportFRitemize}}\protect\vspace{-1\baselineskip}}}}
\DeclareRobustCommand*{\RapportFRcompsocthanksitem}{\item}
\else
% non-compsoc, allow for dual compilation via rerouting to normal \thanks
\long\def\RapportFRcompsocitemizethanks#1{\thanks{#1}}
% redirect to "pseudo-par" \hfil\break\indent after swallowing [] from \RapportFRcompsocthanksitem[]
\DeclareRobustCommand{\RapportFRcompsocthanksitem}{\@ifnextchar [{\@RapportFRthanksswallowoptionalarg}%
{\@RapportFRthanksswallowoptionalarg[\relax]}}
% be sure and break only after first item, be sure and ignore spaces after optional argument
\def\@RapportFRthanksswallowoptionalarg[#1]{\relax\if@RapportFRbreakcompsocthanksitem\hfil\break
\indent\fi\@RapportFRbreakcompsocthanksitemtrue\ignorespaces}
\fi


% V1.6b define the \RapportFRpeerreviewmaketitle as needed
\ifCLASSOPTIONpeerreview
\def\RapportFRpeerreviewmaketitle{\@RapportFRcleardoublepage{empty}%
\ifCLASSOPTIONtwocolumn
\twocolumn[\@RapportFRpeerreviewmaketitle\@RapportFRdynamictitlevspace]
\else
\newpage\@RapportFRpeerreviewmaketitle\@RapportFRstatictitlevskip
\fi
\thispagestyle{RapportFRtitlepagestyle}}
\else
% \RapportFRpeerreviewmaketitle does nothing if peer review option has not been selected
\def\RapportFRpeerreviewmaketitle{\relax}
\fi

% peerreview formats the repeated title like the title in journal papers.
\def\@RapportFRpeerreviewmaketitle{\begin{center}\@RapportFRcompsoconly{\sffamily}%
\normalfont\normalsize\vskip0.2em{\Huge\@title\par}\vskip1.0em\par
\end{center}}



% V1.6 
% this is a static rubber spacer between the title/authors and the main text
% used for single column text, or when the title appears in the first column
% of two column text (technotes). 
\def\@RapportFRstatictitlevskip{{\normalfont\normalsize
% adjust spacing to next text
% v1.6b handle peer review papers
\ifCLASSOPTIONpeerreview
% for peer review papers, the same value is used for both title pages
% regardless of the other paper modes
   \vskip 1\baselineskip plus 0.375\baselineskip minus 0.1875\baselineskip
\else
   \ifCLASSOPTIONconference% conference
      \vskip 1\baselineskip plus 0.375\baselineskip minus 0.1875\baselineskip%
   \else%
      \ifCLASSOPTIONtechnote% technote
         \vskip 1\baselineskip plus 0.375\baselineskip minus 0.1875\baselineskip%
      \else% journal uses more space
         \vskip 2.5\baselineskip plus 0.75\baselineskip minus 0.375\baselineskip%
      \fi
   \fi
\fi}}


% V1.6
% This is a dynamically determined rigid spacer between the title/authors 
% and the main text. This is used only for single column titles over two 
% column text (most common)
% This is bit tricky because we have to ensure that the textheight of the
% main text is an integer multiple of \baselineskip
% otherwise underfull vbox problems may develop in the second column of the
% text on the titlepage
% The possible use of \RapportFRpubid must also be taken into account.
\def\@RapportFRdynamictitlevspace{{%
    % we run within a group so that all the macros can be forgotten when we are done
    \long\def\thanks##1{\relax}%don't allow \thanks to run when we evaluate the vbox height
    \long\def\RapportFRcompsocitemizethanks##1{\relax}%don't allow \RapportFRcompsocitemizethanks to run when we evaluate the vbox height
    \normalfont\normalsize% we declare more descriptive variable names
    \let\@RapportFRmaintextheight=\@RapportFRtrantmpdimenA%height of the main text columns
    \let\@RapportFRINTmaintextheight=\@RapportFRtrantmpdimenB%height of the main text columns with integer # lines
    % set the nominal and minimum values for the title spacer
    % the dynamic algorithm will not allow the spacer size to
    % become less than \@RapportFRMINtitlevspace - instead it will be
    % lengthened
    % default to journal values
    \def\@RapportFRNORMtitlevspace{2.5\baselineskip}%
    \def\@RapportFRMINtitlevspace{2\baselineskip}%
    % conferences and technotes need tighter spacing
    \ifCLASSOPTIONconference%conference
     \def\@RapportFRNORMtitlevspace{1\baselineskip}%
     \def\@RapportFRMINtitlevspace{0.75\baselineskip}%
    \fi
    \ifCLASSOPTIONtechnote%technote
      \def\@RapportFRNORMtitlevspace{1\baselineskip}%
      \def\@RapportFRMINtitlevspace{0.75\baselineskip}%
    \fi%
    % get the height that the title will take up
    \ifCLASSOPTIONpeerreview
       \settoheight{\@RapportFRmaintextheight}{\vbox{\hsize\textwidth \@RapportFRpeerreviewmaketitle}}%
    \else
       \settoheight{\@RapportFRmaintextheight}{\vbox{\hsize\textwidth \@maketitle}}%
    \fi
    \@RapportFRmaintextheight=-\@RapportFRmaintextheight% title takes away from maintext, so reverse sign
    % add the height of the page textheight
    \advance\@RapportFRmaintextheight by \textheight%
    % correct for title pages using pubid
    \ifCLASSOPTIONpeerreview\else
       % peerreview papers use the pubid on the cover page only.
       % And the cover page uses a static spacer.
       \if@RapportFRusingpubid\advance\@RapportFRmaintextheight by -\@RapportFRpubidpullup\fi
    \fi%
    % subtract off the nominal value of the title bottom spacer
    \advance\@RapportFRmaintextheight by -\@RapportFRNORMtitlevspace%
    % \topskip takes away some too
    \advance\@RapportFRmaintextheight by -\topskip%
    % calculate the column height of the main text for lines
    % now we calculate the main text height as if holding
    % an integer number of \normalsize lines after the first
    % and discard any excess fractional remainder
    % we subtracted the first line, because the first line
    % is placed \topskip into the maintext, not \baselineskip like the
    % rest of the lines.
    \@RapportFRINTmaintextheight=\@RapportFRmaintextheight%
    \divide\@RapportFRINTmaintextheight  by \baselineskip%
    \multiply\@RapportFRINTmaintextheight  by \baselineskip%
    % now we calculate how much the title spacer height will
    % have to be reduced from nominal (\@RapportFRREDUCEmaintextheight is always
    % a positive value) so that the maintext area will contain an integer
    % number of normal size lines
    % we change variable names here (to avoid confusion) as we no longer
    % need \@RapportFRINTmaintextheight and can reuse its dimen register
    \let\@RapportFRREDUCEmaintextheight=\@RapportFRINTmaintextheight%
    \advance\@RapportFRREDUCEmaintextheight by -\@RapportFRmaintextheight%
    \advance\@RapportFRREDUCEmaintextheight by \baselineskip%
    % this is the calculated height of the spacer
    % we change variable names here (to avoid confusion) as we no longer
    % need \@RapportFRmaintextheight and can reuse its dimen register
    \let\@RapportFRCOMPENSATElen=\@RapportFRmaintextheight%
    \@RapportFRCOMPENSATElen=\@RapportFRNORMtitlevspace% set the nominal value
    % we go with the reduced length if it is smaller than an increase
    \ifdim\@RapportFRREDUCEmaintextheight < 0.5\baselineskip\relax%
     \advance\@RapportFRCOMPENSATElen by -\@RapportFRREDUCEmaintextheight%
     % if the resulting spacer is too small back out and go with an increase instead
     \ifdim\@RapportFRCOMPENSATElen<\@RapportFRMINtitlevspace\relax%
      \advance\@RapportFRCOMPENSATElen by \baselineskip%
     \fi%
    \else%
     % go with an increase because it is closer to the nominal than a decrease
     \advance\@RapportFRCOMPENSATElen by -\@RapportFRREDUCEmaintextheight%
     \advance\@RapportFRCOMPENSATElen by \baselineskip%
    \fi%
    % set the calculated rigid spacer
    \vspace{\@RapportFRCOMPENSATElen}}}



% V1.6
% we allow the user access to the last part of the title area
% useful in emergencies such as when a different spacing is needed
% This text is NOT compensated for in the dynamic sizer.
\let\@RapportFRaftertitletext=\relax
\long\def\RapportFRaftertitletext#1{\def\@RapportFRaftertitletext{#1}}

% V1.7 provide a way for users to enter abstract and keywords
% into the onecolumn title are. This text is compensated for
% in the dynamic sizer.
\let\@RapportFRcompsoctitleabstractindextext=\relax
\long\def\RapportFRcompsoctitleabstractindextext#1{\def\@RapportFRcompsoctitleabstractindextext{#1}}
% V1.7 provide a way for users to get the \@RapportFRcompsoctitleabstractindextext if
% not in compsoc journal mode - this way abstract and keywords can be placed
% in their conventional position if not in compsoc mode.
\def\RapportFRdisplaynotcompsoctitleabstractindextext{%
\ifCLASSOPTIONcompsoc% display if compsoc conf
\ifCLASSOPTIONconference\@RapportFRcompsoctitleabstractindextext\fi
\else% or if not compsoc
\@RapportFRcompsoctitleabstractindextext\fi}


% command to allow alteration of baselinestretch, but only if the current
% baselineskip is unity. Used to tweak the compsoc abstract and keywords line spacing.
\def\@RapportFRtweakunitybaselinestretch#1{{\def\baselinestretch{1}\selectfont
\global\@tempskipa\baselineskip}\ifnum\@tempskipa=\baselineskip%
\def\baselinestretch{#1}\selectfont\fi\relax}


% abstract and keywords are in \small, except 
% for 9pt docs in which they are in \footnotesize
% Because 9pt docs use an 8pt footnotesize, \small
% becomes a rather awkward 8.5pt
\def\@RapportFRabskeysecsize{\small}
\ifx\CLASSOPTIONpt\@RapportFRptsizenine
 \def\@RapportFRabskeysecsize{\footnotesize}
\fi

% compsoc journals use \footnotesize, compsoc conferences use normalsize
\@RapportFRcompsoconly{\def\@RapportFRabskeysecsize{\footnotesize}}
\@RapportFRcompsocconfonly{\def\@RapportFRabskeysecsize{\normalsize}}




% V1.6 have abstract and keywords strip leading spaces, pars and newlines
% so that spacing is more tightly controlled.
\def\abstract{\normalfont
    \if@twocolumn
      \@RapportFRabskeysecsize\bfseries\textit{\abstractname}---\relax
    \else
      \begin{center}\vspace{-1.78ex}\@RapportFRabskeysecsize\textbf{\abstractname}\end{center}\quotation\@RapportFRabskeysecsize
    \fi\@RapportFRgobbleleadPARNLSP}
% V1.6 RapportFR wants only 1 pica from end of abstract to introduction heading when in 
% conference mode (the heading already has this much above it)
\def\endabstract{\relax\ifCLASSOPTIONconference\vspace{0ex}\else\vspace{1.34ex}\fi\par\if@twocolumn\else\endquotation\fi
    \normalfont\normalsize}

\def\RapportFRkeywords{\normalfont
    \if@twocolumn
      \@RapportFRabskeysecsize\bfseries\textit{\RapportFRkeywordsname}---\relax
    \else
      \begin{center}\@RapportFRabskeysecsize\textbf{\RapportFRkeywordsname}\end{center}\quotation\@RapportFRabskeysecsize
    \fi\@RapportFRgobbleleadPARNLSP}
\def\endRapportFRkeywords{\relax\ifCLASSOPTIONtechnote\vspace{1.34ex}\else\vspace{0.67ex}\fi
    \par\if@twocolumn\else\endquotation\fi%
    \normalfont\normalsize}

\def\keywords{\normalfont
    \if@twocolumn
      \@RapportFRabskeysecsize\bfseries\textit{\RapportFRkeywordsname}---\relax
    \else
      \begin{center}\@RapportFRabskeysecsize\textbf{\RapportFRkeywordsname}\end{center}\quotation\@RapportFRabskeysecsize
    \fi\@RapportFRgobbleleadPARNLSP}
\def\keywords{\relax\ifCLASSOPTIONtechnote\vspace{1.34ex}\else\vspace{0.67ex}\fi
    \par\if@twocolumn\else\endquotation\fi%
    \normalfont\normalsize}

% V1.7 compsoc keywords index terms
\ifCLASSOPTIONcompsoc
  \ifCLASSOPTIONconference% compsoc conference
\def\abstract{\normalfont
      \begin{center}\@RapportFRabskeysecsize\textbf{\large\abstractname}\end{center}\vskip 0.5\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip
      \if@twocolumn\else\quotation\fi\itshape\@RapportFRabskeysecsize%
      \par\@RapportFRgobbleleadPARNLSP}
\def\RapportFRkeywords{\normalfont\vskip 1.5\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip
      \begin{center}\@RapportFRabskeysecsize\textbf{\large\RapportFRkeywordsname}\end{center}\vskip 0.5\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip
      \if@twocolumn\else\quotation\fi\itshape\@RapportFRabskeysecsize%
      \par\@RapportFRgobbleleadPARNLSP}
  \else% compsoc not conference
\def\abstract{\normalfont\@RapportFRtweakunitybaselinestretch{1.15}\sffamily
    \if@twocolumn
      \@RapportFRabskeysecsize\noindent\textbf{\abstractname}---\relax
    \else
      \begin{center}\vspace{-1.78ex}\@RapportFRabskeysecsize\textbf{\abstractname}\end{center}\quotation\@RapportFRabskeysecsize%
    \fi\@RapportFRgobbleleadPARNLSP}
\def\RapportFRkeywords{\normalfont\@RapportFRtweakunitybaselinestretch{1.15}\sffamily
    \if@twocolumn
      \@RapportFRabskeysecsize\vskip 0.5\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip\noindent
      \textbf{\RapportFRkeywordsname}---\relax
    \else
      \begin{center}\@RapportFRabskeysecsize\textbf{\RapportFRkeywordsname}\end{center}\quotation\@RapportFRabskeysecsize%
    \fi\@RapportFRgobbleleadPARNLSP}
  \fi
\fi



% gobbles all leading \, \\ and \par, upon finding first token that
% is not a \ , \\ or a \par, it ceases and returns that token
% 
% used to strip leading \, \\ and \par from the input
% so that such things in the beginning of an environment will not
% affect the formatting of the text
\long\def\@RapportFRgobbleleadPARNLSP#1{\let\@RapportFRswallowthistoken=0%
\let\@RapportFRgobbleleadPARNLSPtoken#1%
\let\@RapportFRgobbleleadPARtoken=\par%
\let\@RapportFRgobbleleadNLtoken=\\%
\let\@RapportFRgobbleleadSPtoken=\ %
\def\@RapportFRgobbleleadSPMACRO{\ }%
\ifx\@RapportFRgobbleleadPARNLSPtoken\@RapportFRgobbleleadPARtoken%
\let\@RapportFRswallowthistoken=1%
\fi%
\ifx\@RapportFRgobbleleadPARNLSPtoken\@RapportFRgobbleleadNLtoken%
\let\@RapportFRswallowthistoken=1%
\fi%
\ifx\@RapportFRgobbleleadPARNLSPtoken\@RapportFRgobbleleadSPtoken%
\let\@RapportFRswallowthistoken=1%
\fi%
% a control space will come in as a macro
% when it is the last one on a line
\ifx\@RapportFRgobbleleadPARNLSPtoken\@RapportFRgobbleleadSPMACRO%
\let\@RapportFRswallowthistoken=1%
\fi%
% if we have to swallow this token, do so and taste the next one
% else spit it out and stop gobbling
\ifx\@RapportFRswallowthistoken 1\let\@RapportFRnextgobbleleadPARNLSP=\@RapportFRgobbleleadPARNLSP\else%
\let\@RapportFRnextgobbleleadPARNLSP=#1\fi%
\@RapportFRnextgobbleleadPARNLSP}%




% TITLING OF SECTIONS
\def\@RapportFRsectpunct{:\ \,}  % Punctuation after run-in section heading  (headings which are
                            % part of the paragraphs), need little bit more than a single space
                            % spacing from section number to title
% compsoc conferences use regular period/space punctuation
\ifCLASSOPTIONcompsoc
\ifCLASSOPTIONconference
\def\@RapportFRsectpunct{.\ }
\fi\fi


\def\@seccntformat#1{\csname the#1dis\endcsname\hskip 0.5em\relax}

\ifCLASSOPTIONcompsoc
% compsoc journals need extra spacing
\ifCLASSOPTIONconference\else
\def\@seccntformat#1{\csname the#1dis\endcsname\hskip 1em\relax}
\fi\fi

%v1.7 put {} after #6 to allow for some types of user font control
%and use \@@par rather than \par
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
     \let\@svsec\@empty
  \else
     \refstepcounter{#1}%
     % load section label and spacer into \@svsec
     \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi%
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@% tempskipa determines whether is treated as a high
     \begingroup #6{\relax% or low level heading
      \noindent % subsections are NOT indented
       % print top level headings. \@svsec is label, #8 is heading title
       % RapportFR does not block indent the section title text, it flows like normal
       {\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\@@par}}%
     \endgroup
     \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth\relax\else
               \protect\numberline{\csname the#1\endcsname}\fi#7}%
  \else % printout low level headings
     % svsechd seems to swallow the trailing space, protect it with \mbox{}
     % got rid of sectionmark stuff
     \def\@svsechd{#6{\hskip #3\relax\@svsec #8\@RapportFRsectpunct\mbox{}}%
     \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth\relax\else
               \protect\numberline{\csname the#1\endcsname}\fi#7}}%
  \fi%skip down
  \@xsect{#5}}


% section* handler
%v1.7 put {} after #4 to allow for some types of user font control
%and use \@@par rather than \par
\def\@ssect#1#2#3#4#5{\@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
     %\begingroup #4\@hangfrom{\hskip #1}{\interlinepenalty \@M #5\par}\endgroup
     % RapportFR does not block indent the section title text, it flows like normal
     \begingroup \noindent #4{\relax{\hskip #1}{\interlinepenalty \@M #5\@@par}}\endgroup
  % svsechd swallows the trailing space, protect it with \mbox{}
  \else \def\@svsechd{#4{\hskip #1\relax #5\@RapportFRsectpunct\mbox{}}}\fi
  \@xsect{#3}}


%% SECTION heading spacing and font
%%
% arguments are: #1 - sectiontype name
% (for \@sect)   #2 - section level
%                #3 - section heading indent
%                #4 - top separation (absolute value used, neg indicates not to indent main text)
%                     If negative, make stretch parts negative too!
%                #5 - (absolute value used) positive: bottom separation after heading,
%                      negative: amount to indent main text after heading
%                Both #4 and #5 negative means to indent main text and use negative top separation
%                #6 - font control
% You've got to have \normalfont\normalsize in the font specs below to prevent
% trouble when you do something like:
% \section{Note}{\ttfamily TT-TEXT} is known to ... 
% RapportFR sometimes REALLY stretches the area before a section
% heading by up to about 0.5in. However, it may not be a good
% idea to let LaTeX have quite this much rubber.
\ifCLASSOPTIONconference%
% RapportFR wants section heading spacing to decrease for conference mode
\def\section{\@startsection{section}{1}{\z@}{1.5ex plus 1.5ex minus 0.5ex}%
{0.7ex plus 1ex minus 0ex}{\normalfont\normalsize\centering\scshape}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{1.5ex plus 1.5ex minus 0.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\normalsize\itshape}}%
\else % for journals
\def\section{\@startsection{section}{1}{\z@}{3.0ex plus 1.5ex minus 1.5ex}% V1.6 3.0ex from 3.5ex
{0.7ex plus 1ex minus 0ex}{\normalfont\normalsize\centering\scshape}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{3.5ex plus 1.5ex minus 1.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\normalsize\itshape}}%
\fi

% for both journals and conferences
% decided to put in a little rubber above the section, might help somebody
\def\subsubsection{\@startsection{subsubsection}{3}{\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\normalsize\itshape}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\normalsize\itshape}}%


% compsoc
\ifCLASSOPTIONcompsoc
\ifCLASSOPTIONconference
% compsoc conference
\def\section{\@startsection{section}{1}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}{\normalfont\large\bfseries}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}{\normalfont\sublargesize\bfseries}}%
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{0ex}{\normalfont\normalsize\bfseries}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\normalsize}}%
\else% compsoc journals
% use negative top separation as compsoc journals do not indent paragraphs after section titles
\def\section{\@startsection{section}{1}{\z@}{-3ex plus -2ex minus -1.5ex}%
{0.7ex plus 1ex minus 0ex}{\normalfont\large\sffamily\bfseries\scshape}}%
% Note that subsection and smaller may not be correct for the Computer Society,
% I have to look up an example.
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.5ex plus -1.5ex minus -1.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\normalsize\sffamily\bfseries}}%
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-2.5ex plus -1ex minus -1ex}%
{0.5ex plus 0.5ex minus 0ex}{\normalfont\normalsize\sffamily\itshape}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{-0ex plus -0.1ex minus -0.1ex}%
{0ex}{\normalfont\normalsize}}%
\fi\fi




%% ENVIRONMENTS
% "box" symbols at end of proofs
\def\RapportFRQEDclosed{\mbox{\rule[0pt]{1.3ex}{1.3ex}}} % for a filled box
% V1.6 some journals use an open box instead that will just fit around a closed one
\def\RapportFRQEDopen{{\setlength{\fboxsep}{0pt}\setlength{\fboxrule}{0.2pt}\fbox{\rule[0pt]{0pt}{1.3ex}\rule[0pt]{1.3ex}{0pt}}}}
\ifCLASSOPTIONcompsoc
\def\RapportFRQED{\RapportFRQEDopen}   % default to open for compsoc
\else
\def\RapportFRQED{\RapportFRQEDclosed} % otherwise default to closed
\fi

% v1.7 name change to avoid namespace collision with amsthm. Also add support
% for an optional argument.
\def\RapportFRproof{\@ifnextchar[{\@RapportFRproof}{\@RapportFRproof[\RapportFRproofname]}}
\def\@RapportFRproof[#1]{\par\noindent\hspace{2em}{\itshape #1: }}
\def\endRapportFRproof{\hspace*{\fill}~\RapportFRQED\par}


%\itemindent is set to \z@ by list, so define new temporary variable
\newdimen\@RapportFRtmpitemindent
\def\@begintheorem#1#2{\@RapportFRtmpitemindent\itemindent\topsep 0pt\rmfamily\trivlist%
    \item[\hskip \labelsep{\indent\itshape #1\ #2:}]\itemindent\@RapportFRtmpitemindent}
\def\@opargbegintheorem#1#2#3{\@RapportFRtmpitemindent\itemindent\topsep 0pt\rmfamily \trivlist%
% V1.6 RapportFR is back to using () around theorem names which are also in italics
% Thanks to Christian Peel for reporting this.
    \item[\hskip\labelsep{\indent\itshape #1\ #2\ (#3):}]\itemindent\@RapportFRtmpitemindent}
% V1.7 remove bogus \unskip that caused equations in theorems to collide with
% lines below.
\def\@endtheorem{\endtrivlist}

% V1.6
% display command for the section the theorem is in - so that \thesection
% is not used as this will be in Roman numerals when we want arabic.
% LaTeX2e uses \def\@thmcounter#1{\noexpand\arabic{#1}} for the theorem number
% (second part) display and \def\@thmcountersep{.} as a separator.
% V1.7 intercept calls to the section counter and reroute to \@RapportFRthmcounterinsection
% to allow \appendix(ices} to override as needed.
%
% special handler for sections, allows appendix(ices) to override
\gdef\@RapportFRthmcounterinsection#1{\arabic{#1}}
% string macro
\edef\@RapportFRstringsection{section}

% redefine the #1#2[#3] form of newtheorem to use a hook to \@RapportFRthmcounterinsection
% if section in_counter is used
\def\@xnthm#1#2[#3]{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}\@newctr{#1}[#3]%
     \edef\@RapportFRstringtmp{#3}
     \ifx\@RapportFRstringtmp\@RapportFRstringsection
     \expandafter\xdef\csname the#1\endcsname{%
     \noexpand\@RapportFRthmcounterinsection{#3}\@thmcountersep
          \@thmcounter{#1}}%
     \else
     \expandafter\xdef\csname the#1\endcsname{%
       \expandafter\noexpand\csname the#3\endcsname \@thmcountersep
          \@thmcounter{#1}}%
     \fi
     \global\@namedef{#1}{\@thm{#1}{#2}}%
     \global\@namedef{end#1}{\@endtheorem}}}



%% SET UP THE DEFAULT PAGESTYLE
\ps@headings
\pagenumbering{arabic}

% normally the page counter starts at 1
\setcounter{page}{1}
% however, for peerreview the cover sheet is page 0 or page -1
% (for duplex printing)
\ifCLASSOPTIONpeerreview
   \if@twoside
      \setcounter{page}{-1}
   \else
      \setcounter{page}{0}
   \fi
\fi

% standard book class behavior - let bottom line float up and down as
% needed when single sided
\ifCLASSOPTIONtwoside\else\raggedbottom\fi
% if two column - turn on twocolumn, allow word spacings to stretch more and
% enforce a rigid position for the last lines
\ifCLASSOPTIONtwocolumn
% the peer review option delays invoking twocolumn
   \ifCLASSOPTIONpeerreview\else
      \twocolumn
   \fi
\sloppy 
\flushbottom
\fi




% \APPENDIX and \APPENDICES definitions

% This is the \@ifmtarg command from the LaTeX ifmtarg package
% by Peter Wilson (CUA) and Donald Arseneau
% \@ifmtarg is used to determine if an argument to a command
% is present or not.
% For instance:
% \@ifmtarg{#1}{\typeout{empty}}{\typeout{has something}}
% \@ifmtarg is used with our redefined \section command if
% \appendices is invoked.
% The command \section will behave slightly differently depending
% on whether the user specifies a title: 
% \section{My appendix title}
% or not:
% \section{}
% This way, we can eliminate the blank lines where the title
% would be, and the unneeded : after Appendix in the table of
% contents 
\begingroup
\catcode`\Q=3
\long\gdef\@ifmtarg#1{\@xifmtarg#1QQ\@secondoftwo\@firstoftwo\@nil}
\long\gdef\@xifmtarg#1#2Q#3#4#5\@nil{#4}
\endgroup
% end of \@ifmtarg defs


% V1.7
% command that allows the one time saving of the original definition
% of section to \@RapportFRappendixsavesection for \appendix or \appendices 
% we don't save \section here as it may be redefined later by other
% packages (hyperref.sty, etc.)
\def\@RapportFRsaveoriginalsectiononce{\let\@RapportFRappendixsavesection\section
\let\@RapportFRsaveoriginalsectiononce\relax}

% neat trick to grab and process the argument from \section{argument}
% we process differently if the user invoked \section{} with no
% argument (title)
% note we reroute the call to the old \section*
\def\@RapportFRprocessthesectionargument#1{%
\@ifmtarg{#1}{%
\@RapportFRappendixsavesection*{\appendixname~\thesectiondis}%
\addcontentsline{toc}{section}{\appendixname~\thesection}}{%
\@RapportFRappendixsavesection*{\appendixname~\thesectiondis \\* #1}%
\addcontentsline{toc}{section}{\appendixname~\thesection: #1}}}

% we use this if the user calls \section{} after
% \appendix-- which has no meaning. So, we ignore the
% command and its argument. Then, warn the user.
\def\@RapportFRdestroythesectionargument#1{\typeout{** WARNING: Ignoring useless
\protect\section\space in Appendix (line \the\inputlineno).}}


% remember \thesection forms will be displayed in \ref calls
% and in the Table of Contents.
% The \sectiondis form is used in the actual heading itself

% appendix command for one single appendix
% normally has no heading. However, if you want a 
% heading, you can do so via the optional argument:
% \appendix[Optional Heading]
\def\appendix{\relax}
\renewcommand{\appendix}[1][]{\@RapportFRsaveoriginalsectiononce\par
    % v1.6 keep hyperref's identifiers unique
    \gdef\theHsection{Appendix.A}%
    % v1.6 adjust hyperref's string name for the section
    \xdef\Hy@chapapp{appendix}%
    \setcounter{section}{0}%
    \setcounter{subsection}{0}%
    \setcounter{subsubsection}{0}%
    \setcounter{paragraph}{0}%
    \gdef\thesection{A}%
    \gdef\thesectiondis{}% 
    \gdef\thesubsection{\Alph{subsection}}%
    \gdef\@RapportFRthmcounterinsection##1{A}
    \refstepcounter{section}% update the \ref counter
    \@ifmtarg{#1}{\@RapportFRappendixsavesection*{\appendixname}%
                  \addcontentsline{toc}{section}{\appendixname}}{%
             \@RapportFRappendixsavesection*{\appendixname~\\* #1}%
             \addcontentsline{toc}{section}{\appendixname: #1}}%
    % redefine \section command for appendix
    % leave \section* as is
    \def\section{\@ifstar{\@RapportFRappendixsavesection*}{%
                    \@RapportFRdestroythesectionargument}}% throw out the argument
                                                     % of the normal form
}



% appendices command for multiple appendices
% user then calls \section with an argument (possibly empty) to
% declare the individual appendices
\def\appendices{\@RapportFRsaveoriginalsectiononce\par
    % v1.6 keep hyperref's identifiers unique
    \gdef\theHsection{Appendix.\Alph{section}}%
    % v1.6 adjust hyperref's string name for the section
    \xdef\Hy@chapapp{appendix}%
    \setcounter{section}{-1}% we want \refstepcounter to use section 0
    \setcounter{subsection}{0}%
    \setcounter{subsubsection}{0}%
    \setcounter{paragraph}{0}%
    \ifCLASSOPTIONromanappendices%
    \gdef\thesection{\Roman{section}}%
    \gdef\thesectiondis{\Roman{section}}%
    \@RapportFRcompsocconfonly{\gdef\thesectiondis{\Roman{section}.}}%
    \gdef\@RapportFRthmcounterinsection##1{A\arabic{##1}}
    \else%
    \gdef\thesection{\Alph{section}}%
    \gdef\thesectiondis{\Alph{section}}%
    \@RapportFRcompsocconfonly{\gdef\thesectiondis{\Alph{section}.}}%
    \gdef\@RapportFRthmcounterinsection##1{\Alph{##1}}
    \fi%
    \refstepcounter{section}% update the \ref counter
    \setcounter{section}{0}% NEXT \section will be the FIRST appendix
    % redefine \section command for appendices
    % leave \section* as is
    \def\section{\@ifstar{\@RapportFRappendixsavesection*}{% process the *-form
                    \refstepcounter{section}% or is a new section so,
                    \@RapportFRprocessthesectionargument}}% process the argument 
                                                 % of the normal form
}



% \RapprotFRstart
% Definition for the big two line drop cap letter at the beginning of the
% first paragraph of journal papers. The first argument is the first letter
% of the first word, the second argument is the remaining letters of the
% first word which will be rendered in upper case.
% In V1.6 this has been completely rewritten to:
% 
% 1. no longer have problems when the user begins an environment
%    within the paragraph that uses \RapportFRstart.
% 2. auto-detect and use the current font family
% 3. revise handling of the space at the end of the first word so that
%    interword glue will now work as normal.
% 4. produce correctly aligned edges for the (two) indented lines.
% 
% We generalize things via control macros - playing with these is fun too.
% 
% V1.7 added more control macros to make it easy for RapportFRtrantools.sty users
% to change the font style.
% 
% the number of lines that are indented to clear it
% may need to increase if using decenders
\def\@RapportFRstartDROPLINES{2}
% minimum number of lines left on a page to allow a \@RapportFRstart
% Does not take into consideration rubber shrink, so it tends to
% be overly cautious
\def\@RapportFRstartMINPAGELINES{2}
% V1.7 the height of the drop cap is adjusted to match the height of this text
% in the current font (when \RapportFRstart is called).
\def\@RapportFRstartHEIGHTTEXT{T}
% the depth the letter is lowered below the baseline
% the height (and size) of the letter is determined by the sum
% of this value and the height of the \@RapportFRstartHEIGHTTEXT in the current
% font. It is a good idea to set this value in terms of the baselineskip
% so that it can respond to changes therein.
\def\@RapportFRstartDROPDEPTH{1.1\baselineskip}
% V1.7 the font the drop cap will be rendered in,
% can take zero or one argument.
\def\@RapportFRstartFONTSTYLE{\bfseries}
% V1.7 any additional, non-font related commands needed to modify
% the drop cap letter, can take zero or one argument.
\def\@RapportFRstartCAPSTYLE{\MakeUppercase}
% V1.7 the font that will be used to render the rest of the word,
% can take zero or one argument.
\def\@RapportFRstartWORDFONTSTYLE{\relax}
% V1.7 any additional, non-font related commands needed to modify
% the rest of the word, can take zero or one argument.
\def\@RapportFRstartWORDCAPSTYLE{\MakeUppercase}
% This is the horizontal separation distance from the drop letter to the main text.
% Lengths that depend on the font (e.g., ex, em, etc.) will be referenced
% to the font that is active when \RapportFRstart is called. 
\def\@RapportFRstartSEP{0.15em}
% V1.7 horizontal offset applied to the left of the drop cap.
\def\@RapportFRstartHOFFSET{0em}
% V1.7 Italic correction command applied at the end of the drop cap.
\def\@RapportFRstartITLCORRECT{\/}

% V1.7 compoc uses nonbold drop cap and small caps word style
\ifCLASSOPTIONcompsoc
\def\@RapportFRstartFONTSTYLE{\mdseries}
\def\@RapportFRstartWORDFONTSTYLE{\scshape}
\def\@RapportFRstartWORDCAPSTYLE{\relax}
\fi

% definition of \RapportFRstart
% THIS IS A CONTROLLED SPACING AREA, DO NOT ALLOW SPACES WITHIN THESE LINES
% 
% The token \@RapportFRstartfont will be globally defined after the first use
% of \RapportFRstart and will be a font command which creates the big letter
% The first argument is the first letter of the first word and the second
% argument is the rest of the first word(s).
\def\RapportFRstart#1#2{\par{%
% if this page does not have enough space, break it and lets start
% on a new one
\@RapportFRtranneedspace{\@RapportFRstartMINPAGELINES\baselineskip}{\relax}%
% V1.7 move this up here in case user uses \textbf for \@RapportFRstartFONTSTYLE
% which uses command \leavevmode which causes an unwanted \indent to be issued
\noindent
% calculate the desired height of the big letter
% it extends from the top of \@RapportFRstartHEIGHTTEXT in the current font
% down to \@RapportFRstartDROPDEPTH below the current baseline
\settoheight{\@RapportFRtrantmpdimenA}{\@RapportFRstartHEIGHTTEXT}%
\addtolength{\@RapportFRtrantmpdimenA}{\@RapportFRstartDROPDEPTH}%
% extract the name of the current font in bold
% and place it in \@RapportFRstartFONTNAME
\def\@RapportFRstartGETFIRSTWORD##1 ##2\relax{##1}%
{\@RapportFRstartFONTSTYLE{\selectfont\edef\@RapportFRstartFONTNAMESPACE{\fontname\font\space}%
\xdef\@RapportFRstartFONTNAME{\expandafter\@RapportFRstartGETFIRSTWORD\@RapportFRstartFONTNAMESPACE\relax}}}%
% define a font based on this name with a point size equal to the desired
% height of the drop letter
\font\@RapportFRstartsubfont\@RapportFRstartFONTNAME\space at \@RapportFRtrantmpdimenA\relax%
% save this value as a counter (integer) value (sp points)
\@RapportFRtrantmpcountA=\@RapportFRtrantmpdimenA%
% now get the height of the actual letter produced by this font size
\settoheight{\@RapportFRtrantmpdimenB}{\@RapportFRstartsubfont\@RapportFRstartCAPSTYLE{#1}}%
% If something bogus happens like the first argument is empty or the
% current font is strange, do not allow a zero height.
\ifdim\@RapportFRtrantmpdimenB=0pt\relax%
\typeout{** WARNING: RapportFRstart drop letter has zero height! (line \the\inputlineno)}%
\typeout{ Forcing the drop letter font size to 10pt.}%
\@RapportFRtrantmpdimenB=10pt%
\fi%
% and store it as a counter
\@RapportFRtrantmpcountB=\@RapportFRtrantmpdimenB%
% Since a font size doesn't exactly correspond to the height of the capital
% letters in that font, the actual height of the letter, \@RapportFRtrantmpcountB,
% will be less than that desired, \@RapportFRtrantmpcountA
% we need to raise the font size, \@RapportFRtrantmpdimenA 
% by \@RapportFRtrantmpcountA / \@RapportFRtrantmpcountB
% But, TeX doesn't have floating point division, so we have to use integer
% division. Hence the use of the counters.
% We need to reduce the denominator so that the loss of the remainder will
% have minimal affect on the accuracy of the result
\divide\@RapportFRtrantmpcountB by 200%
\divide\@RapportFRtrantmpcountA by \@RapportFRtrantmpcountB%
% Then reequalize things when we use TeX's ability to multiply by
% floating point values
\@RapportFRtrantmpdimenB=0.005\@RapportFRtrantmpdimenA%
\multiply\@RapportFRtrantmpdimenB by \@RapportFRtrantmpcountA%
% \@RapportFRstartfont is globaly set to the calculated font of the big letter
% We need to carry this out of the local calculation area to to create the
% big letter.
\global\font\@RapportFRstartfont\@RapportFRstartFONTNAME\space at \@RapportFRtrantmpdimenB%
% Now set \@RapportFRtrantmpdimenA to the width of the big letter
% We need to carry this out of the local calculation area to set the
% hanging indent
\settowidth{\global\@RapportFRtrantmpdimenA}{\@RapportFRstartfont
\@RapportFRstartCAPSTYLE{#1\@RapportFRstartITLCORRECT}}}%
% end of the isolated calculation environment
% add in the extra clearance we want
\advance\@RapportFRtrantmpdimenA by \@RapportFRstartSEP\relax%
% add in the optional offset
\advance\@RapportFRtrantmpdimenA by \@RapportFRstartHOFFSET\relax%
% V1.7 don't allow negative offsets to produce negative hanging indents
\@RapportFRtrantmpdimenB\@RapportFRtrantmpdimenA
\ifnum\@RapportFRtrantmpdimenB < 0 \@RapportFRtrantmpdimenB 0pt\fi
% \@RapportFRtrantmpdimenA has the width of the big letter plus the
% separation space and \@RapportFRstartfont is the font we need to use
% Now, we make the letter and issue the hanging indent command
% The letter is placed in a box of zero width and height so that other
% text won't be displaced by it.
\hangindent\@RapportFRtrantmpdimenB\hangafter=-\@RapportFRstartDROPLINES%
\makebox[0pt][l]{\hspace{-\@RapportFRtrantmpdimenA}%
\raisebox{-\@RapportFRstartDROPDEPTH}[0pt][0pt]{\hspace{\@RapportFRstartHOFFSET}%
\@RapportFRstartfont\@RapportFRstartCAPSTYLE{#1\@RapportFRstartITLCORRECT}%
\hspace{\@RapportFRstartSEP}}}%
{\@RapportFRstartWORDFONTSTYLE{\@RapportFRstartWORDCAPSTYLE{\selectfont#2}}}}






% determines if the space remaining on a given page is equal to or greater
% than the specified space of argument one
% if not, execute argument two (only if the remaining space is greater than zero)
% and issue a \newpage
% 
% example: \@RapportFRtranneedspace{2in}{\vfill}
% 
% Does not take into consideration rubber shrinkage, so it tends to
% be overly cautious
% Based on an example posted by Donald Arseneau
% Note this macro uses \@RapportFRtrantmpdimenB internally for calculations,
% so DO NOT PASS \@RapportFRtrantmpdimenB to this routine
% if you need a dimen register, import with \@RapportFRtrantmpdimenA instead
\def\@RapportFRtranneedspace#1#2{\penalty-100\begingroup%shield temp variable
\@RapportFRtrantmpdimenB\pagegoal\advance\@RapportFRtrantmpdimenB-\pagetotal% space left
\ifdim #1>\@RapportFRtrantmpdimenB\relax% not enough space left
\ifdim\@RapportFRtrantmpdimenB>\z@\relax #2\fi%
\newpage%
\fi\endgroup}



% RapportFRbiography ENVIRONMENT
% Allows user to enter biography leaving place for picture (adapts to font size)
% As of V1.5, a new optional argument allows you to have a real graphic!
% V1.5 and later also fixes the "colliding biographies" which could happen when a 
% biography's text was shorter than the space for the photo.
% MDS 7/2001
% V1.6 prevent multiple biographies from making multiple TOC entries
\newif\if@RapportFRbiographyTOCentrynotmade
\global\@RapportFRbiographyTOCentrynotmadetrue

% biography counter so hyperref can jump directly to the biographies
% and not just the previous section
\newcounter{RapportFRbiography}
\setcounter{RapportFRbiography}{0}

% photo area size
\def\@RapportFRBIOphotowidth{1.0in}    % width of the biography photo area
\def\@RapportFRBIOphotodepth{1.25in}   % depth (height) of the biography photo area
% area cleared for photo
\def\@RapportFRBIOhangwidth{1.14in}    % width cleared for the biography photo area
\def\@RapportFRBIOhangdepth{1.25in}    % depth cleared for the biography photo area
                                  % actual depth will be a multiple of 
                                  % \baselineskip, rounded up
\def\@RapportFRBIOskipN{4\baselineskip}% nominal value of the vskip above the biography

\newenvironment{RapportFRbiography}[2][]{\normalfont\@RapportFRcompsoconly{\sffamily}\footnotesize%
\unitlength 1in\parskip=0pt\par\parindent 1em\interlinepenalty500%
% we need enough space to support the hanging indent
% the nominal value of the spacer
% and one extra line for good measure
\@RapportFRtrantmpdimenA=\@RapportFRBIOhangdepth%
\advance\@RapportFRtrantmpdimenA by \@RapportFRBIOskipN%
\advance\@RapportFRtrantmpdimenA by 1\baselineskip%
% if this page does not have enough space, break it and lets start
% with a new one
\@RapportFRtranneedspace{\@RapportFRtrantmpdimenA}{\relax}%
% nominal spacer can strech, not shrink use 1fil so user can out stretch with \vfill
\vskip \@RapportFRBIOskipN plus 1fil minus 0\baselineskip%
% the default box for where the photo goes
\def\@RapportFRtempbiographybox{{\setlength{\fboxsep}{0pt}\framebox{%
\begin{minipage}[b][\@RapportFRBIOphotodepth][c]{\@RapportFRBIOphotowidth}\centering PLACE\\ PHOTO\\ HERE \end{minipage}}}}%
%
% detect if the optional argument was supplied, this requires the
% \@ifmtarg command as defined in the appendix section above
% and if so, override the default box with what they want
\@ifmtarg{#1}{\relax}{\def\@RapportFRtempbiographybox{\mbox{\begin{minipage}[b][\@RapportFRBIOphotodepth][c]{\@RapportFRBIOphotowidth}%
\centering%
#1%
\end{minipage}}}}% end if optional argument supplied
% Make an entry into the table of contents only if we have not done so before
\if@RapportFRbiographyTOCentrynotmade%
% link labels to the biography counter so hyperref will jump
% to the biography, not the previous section
\setcounter{RapportFRbiography}{-1}%
\refstepcounter{RapportFRbiography}%
\addcontentsline{toc}{section}{Biographies}%
\global\@RapportFRbiographyTOCentrynotmadefalse%
\fi%
% one more biography
\refstepcounter{RapportFRbiography}%
% Make an entry for this name into the table of contents 
\addcontentsline{toc}{subsection}{#2}%
% V1.6 properly handle if a new paragraph should occur while the
% hanging indent is still active. Do this by redefining \par so
% that it will not start a new paragraph. (But it will appear to the
% user as if it did.) Also, strip any leading pars, newlines, or spaces.
\let\@RapportFRBIOORGparCMD=\par% save the original \par command
\edef\par{\hfil\break\indent}% the new \par will not be a "real" \par
\settoheight{\@RapportFRtrantmpdimenA}{\@RapportFRtempbiographybox}% get height of biography box
\@RapportFRtrantmpdimenB=\@RapportFRBIOhangdepth%
\@RapportFRtrantmpcountA=\@RapportFRtrantmpdimenB% countA has the hang depth
\divide\@RapportFRtrantmpcountA by \baselineskip%  calculates lines needed to produce the hang depth
\advance\@RapportFRtrantmpcountA by 1% ensure we overestimate
% set the hanging indent
\hangindent\@RapportFRBIOhangwidth%
\hangafter-\@RapportFRtrantmpcountA%
% reference the top of the photo area to the top of a capital T
\settoheight{\@RapportFRtrantmpdimenB}{\mbox{T}}%
% set the photo box, give it zero width and height so as not to disturb anything
\noindent\makebox[0pt][l]{\hspace{-\@RapportFRBIOhangwidth}\raisebox{\@RapportFRtrantmpdimenB}[0pt][0pt]{%
\raisebox{-\@RapportFRBIOphotodepth}[0pt][0pt]{\@RapportFRtempbiographybox}}}%
% now place the author name and begin the bio text
\noindent\textbf{#2\ }\@RapportFRgobbleleadPARNLSP}{\relax\let\par=\@RapportFRBIOORGparCMD\par%
% 7/2001 V1.5 detect when the biography text is shorter than the photo area
% and pad the unused area - preventing a collision from the next biography entry
% MDS
\ifnum \prevgraf <\@RapportFRtrantmpcountA\relax% detect when the biography text is shorter than the photo
    \advance\@RapportFRtrantmpcountA by -\prevgraf% calculate how many lines we need to pad
    \advance\@RapportFRtrantmpcountA by -1\relax% we compensate for the fact that we indented an extra line
    \@RapportFRtrantmpdimenA=\baselineskip% calculate the length of the padding
    \multiply\@RapportFRtrantmpdimenA by \@RapportFRtrantmpcountA%
    \noindent\rule{0pt}{\@RapportFRtrantmpdimenA}% insert an invisible support strut
\fi%
\par\normalfont}



% V1.6
% added biography without a photo environment
\newenvironment{RapportFRbiographynophoto}[1]{%
% Make an entry into the table of contents only if we have not done so before
\if@RapportFRbiographyTOCentrynotmade%
% link labels to the biography counter so hyperref will jump
% to the biography, not the previous section
\setcounter{RapportFRbiography}{-1}%
\refstepcounter{RapportFRbiography}%
\addcontentsline{toc}{section}{Biographies}%
\global\@RapportFRbiographyTOCentrynotmadefalse%
\fi%
% one more biography
\refstepcounter{RapportFRbiography}%
% Make an entry for this name into the table of contents 
\addcontentsline{toc}{subsection}{#1}%
\normalfont\@RapportFRcompsoconly{\sffamily}\footnotesize\interlinepenalty500%
\vskip 4\baselineskip plus 1fil minus 0\baselineskip%
\parskip=0pt\par%
\noindent\textbf{#1\ }\@RapportFRgobbleleadPARNLSP}{\relax\par\normalfont}


% provide the user with some old font commands
% got this from article.cls
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}


% SPECIAL PAPER NOTICE COMMANDS
% 
% holds the special notice text
\def\@RapportFRspecialpapernotice{\relax}
 
% for special papers, like invited papers, the user can do:
% \RapportFRspecialpapernotice{(Invited Paper)} before \maketitle
\def\RapportFRspecialpapernotice#1{\ifCLASSOPTIONconference%
\def\@RapportFRspecialpapernotice{{\sublargesize\textit{#1}\vspace*{1em}}}%
\else%
\def\@RapportFRspecialpapernotice{{\\*[1.5ex]\sublargesize\textit{#1}}\vspace*{-2ex}}%
\fi}




% PUBLISHER ID COMMANDS
% to insert a publisher's ID footer
% V1.6 \RapportFRpubid has been changed so that the change in page size and style
% occurs in \maketitle. \RapportFRpubid must now be issued prior to \maketitle
% use \RapportFRpubidadjcol as before - in the second column of the title page
% These changes allow \maketitle to take the reduced page height into
% consideration when dynamically setting the space between the author 
% names and the maintext.
%
% the amount the main text is pulled up to make room for the
% publisher's ID footer
% RapportFR uses about 1.3\baselineskip for journals, 
% dynamic title spacing will clean up the fraction
\def\@RapportFRpubidpullup{1.3\baselineskip}
\ifCLASSOPTIONtechnote
% for technotes it must be an integer of baselineskip as there can be no
% dynamic title spacing for two column mode technotes (the title is in the
% in first column) and we should maintain an integer number of lines in the
% second column
% There are some examples (such as older issues of "Transactions on
% Information Theory") in which RapportFR really pulls the text off the ID for
% technotes - about 0.55in (or 4\baselineskip). We'll use 2\baselineskip
% and call it even.
\def\@RapportFRpubidpullup{2\baselineskip}
\fi

% V1.7 compsoc does not use a pullup
\ifCLASSOPTIONcompsoc
\def\@RapportFRpubidpullup{0pt}
\fi

% holds the ID text
\def\@RapportFRpubid{\relax}

% flag so \maketitle can tell if \RapportFRpubid was called
\newif\if@RapportFRusingpubid
\global\@RapportFRusingpubidfalse
% issue this command in the page to have the ID at the bottom
% V1.6 use before \maketitle
\def\RapportFRpubid#1{\def\@RapportFRpubid{#1}\global\@RapportFRusingpubidtrue}


% command which will pull up (shorten) the column it is executed in
% to make room for the publisher ID. Place in the second column of
% the title page when using \RapportFRpubid
% Is smart enough not to do anything when in single column text or
% if the user hasn't called \RapportFRpubid
% currently needed in for the second column of a page with the
% publisher ID. If not needed in future releases, please provide this
% command and define it as \relax for backward compatibility
% v1.6b do not allow command to operate if the peer review option has been 
% selected because \RapportFRpubidadjcol will not be on the cover page.
% V1.7 do nothing if compsoc
\def\RapportFRpubidadjcol{\ifCLASSOPTIONcompsoc\else\ifCLASSOPTIONpeerreview\else
\if@twocolumn\if@RapportFRusingpubid\enlargethispage{-\@RapportFRpubidpullup}\fi\fi\fi\fi}

% Special thanks to Peter Wilson, Daniel Luecking, and the other
% gurus at comp.text.tex, for helping me to understand how best to
% implement the RapportFRpubid command in LaTeX.



%% Lockout some commands under various conditions

% general purpose bit bucket
\newsavebox{\@RapportFRtranrubishbin}

% flags to prevent multiple warning messages
\newif\if@RapportFRWARNthanks
\newif\if@RapportFRWARNRapportFRstart
\newif\if@RapportFRWARNRapportFRbiography
\newif\if@RapportFRWARNRapportFRbiographynophoto
\newif\if@RapportFRWARNRapportFRpubid
\newif\if@RapportFRWARNRapportFRpubidadjcol
\newif\if@RapportFRWARNRapportFRmembership
\newif\if@RapportFRWARNRapportFRaftertitletext
\@RapportFRWARNthankstrue
\@RapportFRWARNRapportFRstarttrue
\@RapportFRWARNRapportFRbiographytrue
\@RapportFRWARNRapportFRbiographynophototrue
\@RapportFRWARNRapportFRpubidtrue
\@RapportFRWARNRapportFRpubidadjcoltrue
\@RapportFRWARNRapportFRmembershiptrue
\@RapportFRWARNRapportFRaftertitletexttrue


%% Lockout some commands when in various modes, but allow them to be restored if needed
%%
% save commands which might be locked out
% so that the user can later restore them if needed
\let\@RapportFRSAVECMDthanks\thanks
\let\@RapportFRSAVECMDRapportFRstart\RapportFRstart
\let\@RapportFRSAVECMDRapportFRbiography\RapportFRbiography
\let\@RapportFRSAVECMDendRapportFRbiography\endRapportFRbiography
\let\@RapportFRSAVECMDRapportFRbiographynophoto\RapportFRbiographynophoto
\let\@RapportFRSAVECMDendRapportFRbiographynophoto\endRapportFRbiographynophoto
\let\@RapportFRSAVECMDRapportFRpubid\RapportFRpubid
\let\@RapportFRSAVECMDRapportFRpubidadjcol\RapportFRpubidadjcol
\let\@RapportFRSAVECMDRapportFRmembership\RapportFRmembership
\let\@RapportFRSAVECMDRapportFRaftertitletext\RapportFRaftertitletext


% disable \RapportFRstart when in draft mode
% This may have originally been done because the pre-V1.6 drop letter
% algorithm had problems with a non-unity baselinestretch
% At any rate, it seems too formal to have a drop letter in a draft
% paper.
\ifCLASSOPTIONdraftcls
\def\RapportFRstart#1#2{#1#2\if@RapportFRWARNRapportFRstart\typeout{** ATTENTION: \noexpand\RapportFRstart
 is disabled in draft mode (line \the\inputlineno).}\fi\global\@RapportFRWARNRapportFRstartfalse}
\fi
% and for technotes
\ifCLASSOPTIONtechnote
\def\RapportFRstart#1#2{#1#2\if@RapportFRWARNRapportFRstart\typeout{** WARNING: \noexpand\RapportFRstart
 is locked out for technotes (line \the\inputlineno).}\fi\global\@RapportFRWARNRapportFRstartfalse}
\fi


% lockout unneeded commands when in conference mode
\ifCLASSOPTIONconference
% when locked out, \thanks, \RapportFRbiography, \RapportFRbiographynophoto, \RapportFRpubid,
% \RapportFRmembership and \RapportFRaftertitletext will all swallow their given text. 
% \RapportFRstart will output a normal character instead
% warn the user about these commands only once to prevent the console screen
% from filling up with redundant messages
\def\thanks#1{\if@RapportFRWARNthanks\typeout{** WARNING: \noexpand\thanks
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@RapportFRWARNthanksfalse}
\def\RapportFRstart#1#2{#1#2\if@RapportFRWARNRapportFRstart\typeout{** WARNING: \noexpand\RapportFRstart
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@RapportFRWARNRapportFRstartfalse}


% LaTeX treats environments and commands with optional arguments differently.
% the actual ("internal") command is stored as \\commandname 
% (accessed via \csname\string\commandname\endcsname )
% the "external" command \commandname is a macro with code to determine
% whether or not the optional argument is presented and to provide the 
% default if it is absent. So, in order to save and restore such a command
% we would have to save and restore \\commandname as well. But, if LaTeX
% ever changes the way it names the internal names, the trick would break.
% Instead let us just define a new environment so that the internal
% name can be left undisturbed.
\newenvironment{@RapportFRbogusbiography}[2][]{\if@RapportFRWARNRapportFRbiography\typeout{** WARNING: \noexpand\RapportFRbiography
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@RapportFRWARNRapportFRbiographyfalse%
\setbox\@RapportFRtranrubishbin\vbox\bgroup}{\egroup\relax}
% and make biography point to our bogus biography
\let\RapportFRbiography=\@RapportFRbogusbiography
\let\endRapportFRbiography=\end@RapportFRbogusbiography

\renewenvironment{RapportFRbiographynophoto}[1]{\if@RapportFRWARNRapportFRbiographynophoto\typeout{** WARNING: \noexpand\RapportFRbiographynophoto
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@RapportFRWARNRapportFRbiographynophotofalse%
\setbox\@RapportFRtranrubishbin\vbox\bgroup}{\egroup\relax}

\def\RapportFRpubid#1{\if@RapportFRWARNRapportFRpubid\typeout{** WARNING: \noexpand\RapportFRpubid 
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@RapportFRWARNRapportFRpubidfalse}
\def\RapportFRpubidadjcol{\if@RapportFRWARNRapportFRpubidadjcol\typeout{** WARNING: \noexpand\RapportFRpubidadjcol
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@RapportFRWARNRapportFRpubidadjcolfalse}
\def\RapportFRmembership#1{\if@RapportFRWARNRapportFRmembership\typeout{** WARNING: \noexpand\RapportFRmembership
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@RapportFRWARNRapportFRmembershipfalse}
\def\RapportFRaftertitletext#1{\if@RapportFRWARNRapportFRaftertitletext\typeout{** WARNING: \noexpand\RapportFRaftertitletext
 is locked out when in conference mode (line \the\inputlineno).}\fi\global\@RapportFRWARNRapportFRaftertitletextfalse}
\fi


% provide a way to restore the commands that are locked out
\def\RapportFRoverridecommandlockouts{%
\typeout{** ATTENTION: Overriding command lockouts (line \the\inputlineno).}%
\let\thanks\@RapportFRSAVECMDthanks%
\let\RapportFRstart\@RapportFRSAVECMDRapportFRstart%
\let\RapportFRbiography\@RapportFRSAVECMDRapportFRbiography%
\let\endRapportFRbiography\@RapportFRSAVECMDendRapportFRbiography%
\let\RapportFRbiographynophoto\@RapportFRSAVECMDRapportFRbiographynophoto%
\let\endRapportFRbiographynophoto\@RapportFRSAVECMDendRapportFRbiographynophoto%
\let\RapportFRpubid\@RapportFRSAVECMDRapportFRpubid%
\let\RapportFRpubidadjcol\@RapportFRSAVECMDRapportFRpubidadjcol%
\let\RapportFRmembership\@RapportFRSAVECMDRapportFRmembership%
\let\RapportFRaftertitletext\@RapportFRSAVECMDRapportFRaftertitletext}



% need a backslash character for typeout output
{\catcode`\|=0 \catcode`\\=12
|xdef|@RapportFRbackslash{\}}


% hook to allow easy disabling of all legacy warnings
\def\@RapportFRlegacywarn#1#2{\typeout{** ATTENTION: \@RapportFRbackslash #1 is deprecated (line \the\inputlineno).
Use \@RapportFRbackslash #2 instead.}}


% provide for legacy commands
\def\authorblockA{\@RapportFRlegacywarn{authorblockA}{RapportFRauthorblockA}\RapportFRauthorblockA}
\def\authorblockN{\@RapportFRlegacywarn{authorblockN}{RapportFRauthorblockN}\RapportFRauthorblockN}
\def\authorrefmark{\@RapportFRlegacywarn{authorrefmark}{RapportFRauthorrefmark}\RapportFRauthorrefmark}
\def\PARstart{\@RapportFRlegacywarn{PARstart}{RapportFRstart}\RapportFRstart}
\def\pubid{\@RapportFRlegacywarn{pubid}{RapportFRpubid}\RapportFRpubid}
\def\pubidadjcol{\@RapportFRlegacywarn{pubidadjcol}{RapportFRpubidadjcol}\RapportFRpubidadjcol}
\def\QED{\@RapportFRlegacywarn{QED}{RapportFRQED}\RapportFRQED}
\def\QEDclosed{\@RapportFRlegacywarn{QEDclosed}{RapportFRQEDclosed}\RapportFRQEDclosed}
\def\QEDopen{\@RapportFRlegacywarn{QEDopen}{RapportFRQEDopen}\RapportFRQEDopen}
\def\specialpapernotice{\@RapportFRlegacywarn{specialpapernotice}{RapportFRspecialpapernotice}\RapportFRspecialpapernotice}



% provide for legacy environments
\def\biography{\@RapportFRlegacywarn{biography}{RapportFRbiography}\RapportFRbiography}
\def\biographynophoto{\@RapportFRlegacywarn{biographynophoto}{RapportFRbiographynophoto}\RapportFRbiographynophoto}
\def\keywords{\@RapportFRlegacywarn{keywords}{RapportFRkeywords}\RapportFRkeywords}
\def\endbiography{\endRapportFRbiography}
\def\endbiographynophoto{\endRapportFRbiographynophoto}
\def\endkeywords{\endRapportFRkeywords}


% provide for legacy IED commands/lengths when possible
\let\labelindent\RapportFRlabelindent
\def\calcleftmargin{\@RapportFRlegacywarn{calcleftmargin}{RapportFRcalcleftmargin}\RapportFRcalcleftmargin}
\def\setlabelwidth{\@RapportFRlegacywarn{setlabelwidth}{RapportFRsetlabelwidth}\RapportFRsetlabelwidth}
\def\usemathlabelsep{\@RapportFRlegacywarn{usemathlabelsep}{RapportFRusemathlabelsep}\RapportFRusemathlabelsep}
\def\iedlabeljustifyc{\@RapportFRlegacywarn{iedlabeljustifyc}{RapportFRiedlabeljustifyc}\RapportFRiedlabeljustifyc}
\def\iedlabeljustifyl{\@RapportFRlegacywarn{iedlabeljustifyl}{RapportFRiedlabeljustifyl}\RapportFRiedlabeljustifyl}
\def\iedlabeljustifyr{\@RapportFRlegacywarn{iedlabeljustifyr}{RapportFRiedlabeljustifyr}\RapportFRiedlabeljustifyr}



% let \proof use the RapportFRtran version even after amsthm is loaded
% \proof is now deprecated in favor of \RapportFRproof
\AtBeginDocument{\def\proof{\@RapportFRlegacywarn{proof}{RapportFRproof}\RapportFRproof}\def\endproof{\endRapportFRproof}}

% V1.7 \overrideRapportFRmargins is no longer supported.
\def\overrideRapportFRmargins{%
\typeout{** WARNING: \string\overrideRapportFRmargins \space no longer supported (line \the\inputlineno).}%
\typeout{** Use the \string\CLASSINPUTinnersidemargin, \string\CLASSINPUToutersidemargin \space controls instead.}}

\newcommand{\fig}[3]{
  \begin{figure}[h]
    \begin{center}
      \includegraphics[width=0.8\linewidth]{#1}
      \caption{#2}
      \label{#3}
    \end{center}
  \end{figure}
}

\newcommand{\smallfig}[4]{
  \begin{figure}[h]
    \begin{center}
      \includegraphics[width=#1\linewidth]{#2}
      \caption{#3}
      \label{#4}
    \end{center}
  \end{figure}
}
\endinput

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of RapportFRtran.cls  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% That's all folks!

