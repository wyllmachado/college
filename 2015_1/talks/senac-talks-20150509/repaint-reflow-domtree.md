# Renderização - Render/Repaint/Reflow/DOMTREE


-----------------------------------

* __name:__ Robson Júnior
* __skill:__ JavaScript
* __company:__ FrontEndDeveloper['Terra Networks S/A']
* __age:__ 22
* __github/twitter:__ robsongajunior

-----------------------------------


## HTML

__O que é HTML ?__

HyperText Markup Language (Linguagem de Marcação de Hipertexto)

![HTML](images/html.jpg)

HTML é nada mais nada menos que um arquivo de texto que possui uma síntaxe que usa __tags__ para que o browser saiba o que e como interpretar essas palavras.


#### Examplos
* __Parágrafo:__ p
* __Imagem:__ img
* __Link:__ a


## CSS

Cascading Style Sheets ou apenas CSS, é uma linguagem de folha de estilo, é o responsável por hoje nós termos uma página
bonita, cheio de cores/animações etc...

`

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

`

__CRIAR PAGINA BONITONA__
![Página Bonitona](images/pretty-page.jpg)


##DOM/CSSOM

### DOM (Document Object Model)
DOM nada mais nada menos é do que o HTML parseado, mas antes o browser teve um trabalho todo para chegar nesse resultado.

![dom-full-process](images/dom-full-process.png)

* Conversão
* Criação de tokens
* Lexicalização
* Criação do DOM


#### O que o DOM não é?
* Não é um documento de especificação binária;
* Não é para setar uma estrutura de dados;
* Não define quais as informações em um documento é relevante ou como informações em um documento está estruturado.

#### O que o DOM realmente é?
* Uma forma para que todas plafaformas conseguem entender a informação
* Responsável por especificar a interface
* O DOM é simplesmente uma API para este conjunto de informações.

![DOM - Table](images/dom-tree.png)


### CSSOM
CSS Object Model provém APIS que permite consultar e manipular estilos. Responsável também pelos parses genéricos e serialização das regras para as media queries, seletores e também o próprio css.

![CSSOM - Contrução](images/cssom-construction.png)

Como podem ver, ele também passa pelos mesmo processos da criação do DOM, só que por sua vez tornando-se CSSOM.

![CSSOM - Tree](images/cssom-tree.png)

### Algumas observações
 * Bytes → caracteres → tokens → nós → modelo de objeto.
 * A marcação HTML é transformada em DOM, a marcação CSS é transformada em CSSOM
 * DOM e CSSOM são estruturas de dados independentes.
 * O Chrome DevTools Timeline possibilita capturar e inspecionar os custos de criação e processamento de DOM e CSSOM.


## Renderizando uma webpage - DOM TREE

![RENDER TREE](images/render-tree-construction.png)

### Passos
* A árvore do DOM e do CSSOM se combinam para formar a árvore de renderização.
* A árvore de renderização contém apenas os nós necessários para renderizar a página.
* O layout computa a posição e o tamanho exatos de cada objeto.
* A pintura é a última etapa, que capta a árvore de renderização final e renderiza os pixels na tela.

### Construindo árvore de renderização
* Iniciando na raiz do DOM, analiza todos nodos visíveis
    - nós invisíveis
    - nodos ocultos por CSS
* Encontra no CSSOM a regra de cada nodo visível
* Devolve nodos visíveis com seus estilos computados

display: none; !== visibility: hidden;

![Position relative to absolute](images/layout-viewport.png)


## Repaint
Repaints são disparados quando a aparência de um elemento é alterada sem alterar seu layout.

`

    function repaint () {
    	var colors = ['purple', 'black', 'blue', 'red', 'green', 'brown', 'white', 'gray'],
    		color  = colors[parseInt(Math.random() * colors.length)];

    	document.body.style.backgroundColor = color;
    };
    document.getElementById('repaintBTN').addEventListener('click', repaint);

`


## Reflow
Reflows são os mais custosos, causados quando as mudanças alterando o layout da página,
como por exemplo alterar o width de um elemento.

`

    for (var i = 0; i &lt; 100; i++) {
      document.getElementById("myList").innerHTML += "&lt;span&gt;" + i + "&lt;/span&gt;";
    }
`

`

    var myList = "";
    for (var i = 0; i &lt; 100; i++) {
      myList += "&lt;span&gt;" + i + "&lt;/span&gt;";
    }
    document.getElementById("myList").innerHTML = myList;
`

`

    var myListHTML = document.getElementById("myList").innerHTML;
    for (var i = 0; i &lt; 100; i++) {
      myListHTML += "&lt;span&gt;" + i + "&lt;/span&gt;";
    }
`
[Resultados JSPerf](http://jsperf.com/browser-diet-dom-manipulation/11)


## Tools
* [Paint_Flashing_Tool](https://developer.mozilla.org/pt-BR/docs/Tools/Paint_Flashing_Tool)


## SAMPLES
* [REPAINT](samples/repaint.html)
* [REFLOW](samples/reflow-1.html)
* [REPAINT/REFLOW](samples/repaint-reflow.html)


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
