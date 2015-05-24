# Características relacionadas ao modelo Hierárquico, Rede e Relacional

## Aluno
* __Nome:__ Robson Gomes de Araújo Júnior
* __Turma:__ Análise e Desenvolvimento de Sistemas
* __Turno:__ Noite
* __Dia:__ Sexta-feira


## Modelos

### Hierárquico
O modelo hierárquico durou até a chegada do __modelo relacional__ junto com o fato dele ter tomado conta e se tornado
modelo padrão.
O modelo hieráquico foi-se muito usado na época dos mainframes, porém sempre teve o poblema de não poder ser moldado parecido com o mundo real.

Esse modelo faz com que o relacionamente seja da forma __árvore__ com __raiz__, cada árvore só tem acesso a sua raiz, assim
tendo que duplicar a informação a ser armazenada.

Ligações formadas em árevore somente retrata relações um-pra-um ou um-pra-muitos entre um pai e filho.


#### Desvantagens
* Dados redundantes
* Difuldade em manutenção
* Alteração de código caso uso de __junções de tabela pré-definidas__


### Rede
O modelo em rede é uma extensão do modelo hierárquico, ela permite o uso de um dado em divérsos
lugares sem causar a redundância de dados, cada registro filho pode ser lugado a mais de um registro pai,
sua organização é feita em cima de grafos. Isso permite criar conexões bastante complexas.

* __Rede:__ gráfico matemático que captura as relações entre objetos. São formado por links e nós;
* __Nó:__ representa um objeto em uma rede;
* __Link:__ representa a relação entre dois objetos;
* __Caminho:__ corresponde a um percurso através de rede formado por links e nós;

#### Vantagens
* Não redundância de dados
* Conexões complexas
* Busca do caminho mais fácil


### Relacional
Baseado no conceito entidade relação, a príncipal representação dos dados é a relação, uma tabela com linhas não ordenadas e colunas.
Essa relação é composta por um __esquema__ e uma __instância__

* __Esquema:__ Especifíca o nome da relação e o domínio de cada coluna;
* __Instância:__ Conjunto de linhas, denominadads tuplas ou registros

Esse modelo é de características como, organização de dados, integridade e uma linguagem formal __(SQL)__.

#### Vantagens
* Integridade de dados
* Não redundância de dados
* Linguagem formal


### Resumo
Todas os modelos tem sua peculiaridade, mas não podemos negar que o mais usado hoje é o relacional por suas diversas vantagens como, integridade de dados, nãoter dados duplicados e etc... também não podemos negar que o modelo em rede também chama bastante atenção também permitindo a não redundância de dados e podendo criar suas conexões compĺexas com inteligencias de descobrirem o melhor caminho. E pra fechar, na minha opnião o modelo hierárquivo hoje serve como um modelo dinossauro, disponibilzando pouca ou nenhuma vantagens e mostrando vários problemas.


## Referências
* http://pt.wikipedia.org/wiki/Modelo_hier%C3%A1rquico
* http://www.profissionaisti.com.br/2011/12/um-pouco-sobre-banco-de-dados-hierarquico/
* http://www.devmedia.com.br/armazenando-relacionamentos-hierarquicos-em-bancos-de-dados-relacionais-revista-sql-magazine-104/25970
* http://www.portaleducacao.com.br/informatica/artigos/53042/organizacao-de-um-banco-de-dados-modelo-hierarquico
* http://pt.wikipedia.org/wiki/Base_de_dados_em_rede
* http://homepages.dcc.ufmg.br/~clodoveu/files/2009_1_BDG_Semin/Modelo%20de%20dados%20de%20rede%20-%20Vinicius%20Rodrigues.pdf
* http://www.ic.unicamp.br/~geovane/mo410-091/Ch03-RM-Resumo.pdf 