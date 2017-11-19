<%@page import="java.util.ArrayList"%>
<%@page import="bean.Usuario"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="ls-theme-blue">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Clientes</title>

        <meta charset="utf-8">
        <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <meta name="description" content="Insira aqui a descrição da página.">

        <link href="view/stylesheets/locastyle.css" rel="stylesheet" type="text/css">

        <link href="http://assets.locaweb.com.br/locastyle/3.10.1/stylesheets/locastyle.css" rel="stylesheet" type="text/css">
        <link rel="icon" sizes="192x192" href="/locawebstyle/assets/images/ico-boilerplate.png">
        <link rel="apple-touch-icon" href="/locawebstyle/assets/images/ico-boilerplate.png">

        <script src="view/javascripts/highcharts.js" type="text/javascript"></script>
        <script src="view/javascripts/panel-charts.js" type="text/javascript"></script>
    </head>
    <body>

        <div class="ls-topbar ">

            <!-- Barra de Notificações -->
            <div class="ls-notification-topbar">

                <!-- Links de apoio -->
                <div class="ls-alerts-list">
                    <a href="#" class="ls-ico-bell-o" data-counter="8" data-ls-module="topbarCurtain" data-target="#ls-notification-curtain"><span>Notificações</span></a>
                    <a href="#" class="ls-ico-bullhorn" data-ls-module="topbarCurtain" data-target="#ls-help-curtain"><span>Ajuda</span></a>
                    <a href="#" class="ls-ico-question" data-ls-module="topbarCurtain" data-target="#ls-feedback-curtain"><span>Sugestões</span></a>
                </div>

                <!-- Dropdown com detalhes da conta de usuário -->
                <div data-ls-module="dropdown" class="ls-dropdown ls-user-account">
                    <a href="#" class="ls-ico-user">
                        <img src="/locawebstyle/assets/images/locastyle/avatar-example.jpg" alt="" />
                        <%
                            int id = 0;
                            String nome = null;
                            String email = null;

                            List<Usuario> usuario = (ArrayList) session.getAttribute("objUsuario");
                            for (Usuario u : usuario) {
                                id = u.getId();
                                nome = u.getNome();
                                email = u.getEmail();
                                //out.print(u.getNome());
                            }
                        %>
                        <span class="ls-name">Olá <%=nome%>!</span>
                    </a>

                    <nav class="ls-dropdown-nav ls-user-menu">
                        <ul>
                            <li><a href="#">Meus dados</a></li>
                            <li><a href="LogoutController">Sair</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

            <span class="ls-show-sidebar ls-ico-menu"></span>

            <a href="LoginController"  class="ls-go-next"><span class="ls-text">Voltar à lista de serviços</span></a>

            <!-- Nome do produto/marca com sidebar -->
            <h1 class="ls-brand-name">
                <a href="home" class="ls-ico-bars">
                    <small>Sistema de gerenciamento</small>
                    SmartSolutions
                </a>
            </h1>

            <!-- Nome do produto/marca sem sidebar quando for o pre-painel  -->
        </div>


        <aside class="ls-sidebar">

            <div class="ls-sidebar-inner">
                <a href="LoginController"  class="ls-go-prev"><span class="ls-text">Voltar à lista de serviços</span></a>

                <nav class="ls-menu">
                    <ul>
                        <li><a href="LoginController" class="ls-ico-dashboard" title="Dashboard">Dashboard</a></li>
                        <li><a href="CadastrarClienteController" class="ls-ico-user-add" title="Clientes">Cadastro</a></li>
                        <li><a href="MainController?flag=listar" class="ls-ico-users" title="Clientes">Clientes</a></li>
                        <!--<li><a href="pesquisar_cliente.html" class="ls-ico-search" title="Clientes">Pesquisa</a></li>-->
                        <li><a href="RelatorioController" class="ls-ico-stats" title="Relatórios da revenda">Relatórios da revenda</a></li>
                        <li>
                            <a href="#" class="ls-ico-cog" title="Configurações">Configurações</a>
                            <ul>
                                <li><a href="ConfiguracaoEmailController">E-mail de Remetente</a></li>
                                <li><a href="ConfiguracaoAtendimentoController">Atendimento</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>


            </div>
        </aside>


        <main class="ls-main ">
            <div class="container-fluid">
                <h1 class="ls-title-intro ls-ico-users">Editar Registro</h1>

                <a href="view/cadastrar_cliente.jsp" class="ls-btn-primary">Cadastrar novo</a>
                <a href="MainController?flag=listar" class="ls-btn-primary">Carregar lista</a>

                <hr>

                <div class="alert alert-success">
                    <input type="hidden" id="mensagem" value="<c:out value="${mensagem}"/>"/>
                    <script type="text/javascript">
                        var result = document.getElementById('mensagem').value;
                        if (result != null && result != "")
                        {
                            alert(result);
                            window.history.back();
                        }
                    </script>

                </div>

                <form name="cadastro" action="MainController" method="POST" class="ls-form ls-form-horizontal row">
                    <c:forEach var="cliente" items="${listaClientes}">

                        <fieldset>
                            <label class="ls-label col-md-1 col-xs-12">
                                <b class="ls-label-text">ID</b>
                                <input  disabled="disabled" class="ls-field" type="text" name="id" class="input" value="${cliente.id}">
                            </label>
                        </fieldset>

                        <fieldset>
                            <label class="ls-label col-md-4 col-xs-12">
                                <b class="ls-label-text">Nome</b>
                                <input class="form-control" type="text" name="nome" class="input" value="${cliente.nome}">
                            </label>

                            <label class="ls-label col-md-3 col-xs-12">
                                <b class="ls-label-text">CNPJ</b>
                                <input type="text" name="cnpj" class="input" value="${cliente.cnpj}">
                            </label>
                        </fieldset>

                        <fieldset>
                            <label class="ls-label col-md-2 col-xs-12">
                                <b class="ls-label-text">Telefone</b>
                                <input type="text" name="telefone" class="input" value="${cliente.telefone}">
                            </label>

                            <label class="ls-label col-md-4 col-xs-12">
                                <b class="ls-label-text">Cidade</b>
                                <input type="text" name="cidade" class="input" value="${cliente.cidade}">
                            </label>

                            <label class="ls-label col-md-1 col-xs-12">
                                <b class="ls-label-text">Estado</b>
                                <input type="text" name="estado" class="input" value="${cliente.estado}">
                            </label>
                        </fieldset>

                        <hr>

                        <fieldset>
                            <label class="ls-label col-md-2 col-xs-12">
                                <b class="ls-label-text">CEP</b>
                                <input type="text" name="cep" class="input" value="${cliente.cep}">
                            </label>

                            <label class="ls-label col-md-3 col-xs-12">
                                <b class="ls-label-text">Bairro</b>
                                <input type="text" name="bairro" class="input" value="${cliente.bairro}">
                            </label>
                        </fieldset>

                        <fieldset>


                            <label class="ls-label col-md-5 col-xs-12">
                                <b class="ls-label-text">Endereço</b>
                                <input type="text" name="endereco" class="input" value="${cliente.endereco}">
                            </label>
                        </fieldset>

                        <hr>

                        <fieldset>
                            <label class="ls-label col-md-3 col-xs-12">
                                <b class="ls-label-text">Usuário</b>
                                <input type="text" name="usuario" class="input" value="${cliente.usuario}">
                            </label>

                            <label class="ls-label col-md-3 col-xs-12">

                            </label>
                        </fieldset>

                        <fieldset>
                            <label class="ls-label col-md-3 col-xs-12">
                                <b class="ls-label-text">E-mail</b>
                                <input type="text" name="email" class="input" value="${cliente.email}">
                            </label>

                            <label class="ls-label col-md-3 col-xs-12">
                                <b class="ls-label-text">Senha</b>
                                <input type="text" name="senha" class="input" value="${cliente.senha}">
                            </label>

                        </fieldset>

                        <div class="ls-actions-btn">
                            <label>&nbsp;</label><input type="submit" name="btCadastrar" value="Salvar" style="width: 120px;" class="ls-btn-primary">
                            <input type="hidden" name="flag" value="salvar">
                            <input type="hidden" name="id" value="${cliente.id}">
                            <!--<input type="button" name="btVoltar" onclick="history.go(-1);" value="Voltar" class="botao">-->
                            <!-- <td><a href="MainController?flag=editar&idcli=${cliente.id}">Editar</a></td>
                            <td><a href="MainController?flag=excluir&idcli=${cliente.id}">Excluir</a></td>-->
                        </div>



                    </c:forEach>
                </form>
            </div>

            <footer class="ls-footer" role="contentinfo">
                <nav class="ls-footer-menu">
                    <h2 class="ls-title-footer">suporte e ajuda</h2>
                    <ul class="ls-footer-list">
                        <li>
                            <a href="#" target="_blank" class="bg-customer-support">
                                <span class="visible-lg">Atendimento</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank" class="bg-my-tickets">
                                <span class="visible-lg">Meus Chamados</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank" class="bg-help-desk">
                                <span class="visible-lg">Central de Ajuda (Wiki)</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank" class="bg-statusblog">
                                <span class="visible-lg">Statusblog</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="ls-footer-info">
                    <span class="last-access ls-ico-screen"><strong>Último acesso: </strong>99/99/9999 99:99:99</span>
                    <div class="set-ip"><strong>IP:</strong> 000.00.00.000</div>
                    <p class="ls-copy-right">Copyright © 1997-2017 Serviços de Internet S/A.</p>
                </div>
            </footer>

        </main>




        <!-- We recommended use jQuery 1.10 or up -->
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="http://assets.locaweb.com.br/locastyle/3.10.1/javascripts/locastyle.js" type="text/javascript"></script>
    </body>
</html>

