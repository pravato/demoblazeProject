# README #

Este README contém instruções sobre como preparar o ambiente de automação e como executar os testes em um ambiente local.

### Para que serve este repositório? ###

* Aqui está o seguinte teste:
  * Utilizando o Robot Framework, crie cenários em BDD utilizando automatização que contemplem o seguinte:
    1.	Criação de conta
    2.	Compra com 3 produtos no carrinho 
    3.	Adição no carrinho de um celular, um monitor e um computador. Já dentro do carrinho, remova o monitor, atualize a página e confirme a remoção do item


### Como posso configurar? ###

* Configuração
	1. Python e PyCharm
	2. Abrir o terminal e rodar:
		* pip install robotframework
        * pip install robotframework-seleniumlibrary
        * pip install selenium==4.9.0
        * pip install faker
    3. Fazer o download da últime versão do ChromeDriver em: https://googlechromelabs.github.io/chrome-for-testing/
        * Colar o ChromeDriver no caminho no path do Python
* Como rodar os testes
	1. Abrir o terminal no PyCharm
	2. Rodar o comando:
		* robot -d ./output tests
* Output
	* Os resultados do teste estarão em uma pasta chamada ‘output’ contendo o relatório com os logs, além das ‘screenshots’.