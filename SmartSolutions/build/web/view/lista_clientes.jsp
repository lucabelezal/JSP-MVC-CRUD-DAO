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
                <h1 class="ls-title-intro ls-ico-users">Clientes</h1>

                <a href="view/cadastrar_cliente.jsp" class="ls-btn-primary">Cadastrar novo</a>
                <a href="MainController?flag=listar" class="ls-btn-primary">Carregar lista</a>

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

                <div class="ls-box-filter">
                    <form action="" class="ls-form ls-form-inline ls-float-left">
                        <label class="ls-label col-md-6 col-sm-8">
                            <b class="ls-label-text">Status</b>
                            <div class="ls-custom-select ls-field-sm">
                                <select name="" class="ls-select">
                                    <option>Todos</option>
                                    <option>Ativos</option>
                                    <option>Desativados</option>
                                </select>
                            </div>
                        </label>
                    </form>

                    <!--<form  action="" class="ls-form ls-form-inline ls-float-right">
                                            <label class="ls-label" role="search">
                                                <b class="ls-label-text ls-hidden-accessible">Nome do cliente</b>
                                                <input type="text" id="q" name="q" aria-label="Faça sua busca por cliente" placeholder="Nome do cliente" required="" class="ls-field-sm">
                                            </label>
                                            <div class="ls-actions-btn">
                                                <input type="submit" value="Buscar" class="ls-btn ls-btn-sm" title="Buscar">
                                            </div>
                                        </form>-->

                    <form name="pesquisa" action="MainController" method="post" class="ls-form ls-form-inline ls-float-right">

                        <label class="ls-label" role="search">
                            <b class="ls-label-text ls-hidden-accessible">Nome do cliente</b>
                            <input type="text" name="pesquisa" class="input"><br>
                        </label>
                        <!--<hr>-->
                        <div class="ls-actions-btn">
                            <!--<input type="submit" value="Buscar" class="ls-btn ls-btn-sm" title="Buscar">-->
                            <input type="submit" name="btPesquisar" value="Pesquisar" class="ls-btn ls-btn-sm">
                            <input type="hidden" name="flag" value="pesquisar">
                        </div>
                        <!--<input type="button" name="btVoltar" onclick="history.go(-1);" value="Voltar" class="botao btn btn-danger">-->

                    </form>
                </div>

                <table class="ls-table">
                    <thead>
                        <tr>
                            <!--<th class="ls-txt-center hidden-xs" >ID</th>-->
                            <th class="ls-txt-center">NOME</th>
                            <th class="ls-txt-center">CNPJ</th>
                            <th class="ls-txt-center">TEL.</th>
                            <!--<th class="ls-txt-center">ESTADO</th>-->
                            <th class="ls-txt-center">CIDADE</th>
                            <!--<th class="ls-txt-center">BAIRRO</th>-->
                            <!--<th class="ls-txt-center">CEP</th>-->
                            <th class="ls-txt-center">END.</th>
                            <th class="ls-txt-center">USUA.</th>
                            <!--<th class="ls-txt-center">EMAIL</th>-->
                            <!--<th class="ls-txt-center">SENHA</th>-->
                            <th style="width: 80px;"></th>
                            <th style="width: 80px;"></th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="cliente" items="${listaClientes}">
                            <tr>
                                <!--<td>${cliente.id}</td>-->
                                <td>${cliente.nome}</td>
                                <td>${cliente.cnpj}</td>
                                <td>${cliente.telefone}</td>
                                <!--<td>${cliente.estado}</td>-->
                                <td>${cliente.cidade}</td>
                                <!--<td>${cliente.bairro}</td>-->
                                <!--<td>${cliente.cep}</td>-->
                                <td>${cliente.endereco}</td>
                                <td>${cliente.usuario}</td>
                                <!--<td>${cliente.email}</td>-->
                                <!--<td>${cliente.senha}</td>-->

                                <td><a href="MainController?flag=editar&idcli=${cliente.id}">Editar</a></td>
                                <td><a href="MainController?flag=excluir&idcli=${cliente.id}">Excluir</a></td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>

                <div class="ls-pagination-filter">
                    <ul class="ls-pagination">
                        <li><a href="#">« Anterior</a></li>
                        <li class="ls-active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#" class="hidden-xs">4</a></li>
                        <li><a href="#" class="hidden-xs">5</a></li>
                        <li><a href="#">Próximo »</a></li>
                    </ul>

                    <div class="ls-filter-view">
                        <label for="">
                            Exibir
                            <div class="ls-custom-select ls-field-sm">
                                <select name="" id="">
                                    <option value="10">10</option>
                                    <option value="30">30</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                            </div>
                            ítens por página
                        </label>
                    </div>
                </div>


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

