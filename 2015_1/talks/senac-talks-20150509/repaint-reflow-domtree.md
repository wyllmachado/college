# Renderização - Render/Repaint/Reflow/DOMTREE

-----------------------------------

* __Nome:__ Robson Júnior
* __Idade:__ 22
* __Bio:__ Estudante de Análise e Desenvolvimento de Sistemas no SenacRS. Membro da Organização JSROCKS, Front-End Developer na empresa Terra Networks S/A. Apaixonado por Open Source e atualmente reside na imensidão da Weblândia.
* __GitHub:__ https://github.com/robsongajunior
* __Twitter:__ https://twitter.com/robsongajunior

-----------------------------------


## HTML

__O que é HTML ?__

HyperText Markup Language (Linguagem de Marcação de Hipertexto)

![HTML](images/html.jpg)

HTML é nada mais nada menos que um arquivo de texto que possui uma síntaxe
que usa __tags__ para que o browser saiba o que e como interpretar essas palavras.

#### Examplos
* __Parágrafo:__ p
* __Imagem:__ img
* __Link:__ a


## CSS

* Cascading Style Sheets ou apenas CSS
* é uma linguagem de folha de estilo
* responsável por hoje nós termos uma página

``` CSS
    body {
        background-color: #dedede;
    }
    .wrap-content {
        width: 75%;
        height: 50%;
        margin: 0 auto;
        background-color: #fff;
        border-radius: 4px;
        border: solid 1px rgba(0,0,0,0.2);
    }
```

__CRIAR PAGINA BONITONA__
![Página Bonitona](images/pretty-page.jpg)


##DOM/CSSOM

### DOM (Document Object Model)

__Brincadeira com DOM do Fast And Furious__

DOM nada mais e nada menos é do que o HTML parseado, porém,
antes o browser passou por um grande trabalho para chegar nesse resultado(DOM).

#### Os quatro passos
* Conversão
* Criação de tokens
* Lexicalização
* Criação do DOM

![dom-full-process](images/dom-full-process.png)

#### O que o DOM não é?
* Não é um documento de especificação binária;
* Não é para setar uma estrutura de dados;
* Não define quais as informações em um documento é relevante ou como informações em um documento está estruturado.

#### O que o DOM realmente é?
* Uma forma para que todas plafaformas conseguem entender a informação
* Responsável por especificar a interface
* O DOM é simplesmente uma API para este conjunto de informações.

##### Pazer, DOM
![DOM - Table](images/dom-tree.png)


### CSSOM
* CSS Object Model
* Provém APIS que permite consultar e manipular estilos.
* Responsável também pelos parses genéricos e serialização das regras para as media queries,
seletores e também o próprio css.

#### Os quatro passos
![CSSOM - Contrução](images/cssom-construction.png)

Como podem ver, ele também passa pelos mesmo processos da criação do DOM, só que por sua vez tornando-se CSSOM.

#### Os quatro passos
* Conversão
* Criação de tokens
* Lexicalização
* Criação do DOM

##### Pazer, CSSOM
![CSSOM - Tree](images/cssom-tree.png)

### DOM/CSSOM observações
* Bytes → caracteres → tokens → nós → modelo de objeto.
* A marcação HTML é transformada em DOM, a marcação CSS é transformada em CSSOM
* DOM e CSSOM são estruturas de dados independentes.


## Renderizando uma webpage - DOM TREE

![RENDER TREE](images/render-tree-construction.png)

### Construindo árvore de renderização
* Iniciando na raiz do DOM, analiza todos nodos visíveis
    - nós invisíveis
    - nodos ocultos por CSS
* Encontra no CSSOM a regra de cada nodo visível
* Devolve nodos visíveis com seus estilos computados

__display: none !== visibility: hidden__

![Position relative to absolute](images/layout-viewport.png)

### Recaptulando os passos
* A árvore do DOM e do CSSOM se combinam para formar a árvore de renderização.
* A árvore de renderização contém apenas os nós necessários para renderizar a página.
* O layout computa a posição e o tamanho exatos de cada objeto.
* A pintura é a última etapa, que capta a árvore de renderização final e renderiza os pixels na tela.


## Repaint
Repaints são disparados quando a aparência de um elemento é alterada sem alterar seu layout.

``` javascript
    function repaint () {
    	var colors = ['purple', 'black', 'blue', 'red', 'green', 'brown', 'white', 'gray'],
    		color  = colors[parseInt(Math.random() * colors.length)];

    	document.body.style.backgroundColor = color;
    };
    document.getElementById('repaintBTN').addEventListener('click', repaint);
```


## Reflow
Reflows são os mais custosos, causados quando as mudanças alterando o layout da página,
como por exemplo alterar o width de um elemento.

__Exemplo__
Esses três exemplos abordam um pouco de performance, apenas para dar uma idéia.

``` javascript
function reflow () {
    var widthBox = ['20px',
                    '40px',
		    '80px',
		    '100px',
		    '120px',
		    '140px',
	    	    '160px',
		    '180px',
		    '200px',
		    '220px'],
		squareBox = document.getElementById('squareBox'),
		sizeBox   = widthBox[parseInt(Math.random() * widthBox.length)];

    squareBox.style.width = sizeBox;
    squareBox.style.height = sizeBox;
};

document.getElementById('reflowBTN').addEventListener('click', reflow);
```


## Tools
* [Firefox = Paint Flashing Tool](https://developer.mozilla.org/pt-BR/docs/Tools/Paint_Flashing_Tool)
* [Chrome = DevTools - Timeline](https://developer.chrome.com/devtools/docs/timeline)


## SAMPLES
* [REPAINT](samples/repaint.html)
* [REFLOW](samples/reflow-1.html)
* [REPAINT/REFLOW](samples/repaint-reflow.html)
* [REPAINT/REFLOW PERFORMANCE](http://jsperf.com/browser-diet-dom-manipulation/11) 


## References
* http://www.w3.org/TR/DOM-Level-2-Core/introduction.html
* https://developers.google.com/web/fundamentals/performance/critical-rendering-path/constructing-the-object-model?hl=en
* https://developers.google.com/web/fundamentals/performance/critical-rendering-path/constructing-the-object-model?hl=pt-br#css-object-model-cssom
* http://dev.w3.org/csswg/cssom/
* https://developers.google.com/web/fundamentals/performance/critical-rendering-path/render-tree-construction
* http://www.phpied.com/rendering-repaint-reflowrelayout-restyle/
* https://developers.google.com/web/fundamentals/performance/critical-rendering-path/measure-crp?hl=en
* https://developers.google.com/web/fundamentals/performance/critical-rendering-path/analyzing-crp?hl=en
* https://developers.google.com/web/fundamentals/performance/critical-rendering-path/optimizing-critical-rendering-path?hl=en
* http://browserdiet.com/pt/
* https://www.youtube.com/watch?v=jw4tVn7CRcI
* https://www.youtube.com/watch?v=a2_6bGNZ7bA
* https://developer.mozilla.org/pt-BR/docs/Tools/Paint_Flashing_Tool
