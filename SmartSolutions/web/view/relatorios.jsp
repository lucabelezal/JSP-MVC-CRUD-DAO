<%@page import="java.util.ArrayList"%>
<%@page import="bean.Usuario"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="ls-theme-blue">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatórios</title>

        <meta charset="utf-8">
        <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <meta name="description" content="Insira aqui a descrição da página.">

        <link href="view/stylesheets/locastyle.css" rel="stylesheet" type="text/css">

        <link href="http://assets.locaweb.com.br/locastyle/3.10.1/stylesheets/locastyle.css" rel="stylesheet" type="text/css">
        <link rel="icon" sizes="192x192" href="/locawebstyle/assets/images/ico-boilerplate.png">
        <link rel="apple-touch-icon" href="/locawebstyle/assets/images/ico-boilerplate.png">

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
                        <li><a href="OrdemServicoController?flag=listar" class="ls-ico-text2" title="Ordem de Serviço">Ordem Serviço</a></li>
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
                <h1 class="ls-title-intro ls-ico-stats">Relatórios da revenda</h1>
                <div class="ls-group-btn ls-group-active ls-float-right">
                    <button type="button" data-ls-module="tabs" data-target=".child1" class="ls-btn ls-active ls-ico-chart-bar-up"></button>
                    <button type="button" data-ls-module="tabs" data-target=".child2" class="ls-btn ls-ico-table-alt"></button>
                </div>
                <ul class="ls-tabs-nav" id="awesome-tab">
                    <li class="ls-active"><a data-ls-module="tabs" href="#tab1">Contratos x distribuídos</a></li>
                    <li><a data-ls-module="tabs" href="#tab2">Status de clientes</a></li>
                </ul>
                <div class="ls-tabs-container" id="awesome-tab-content">
                    <div id="tab1" class="ls-tab-content ls-active">

                        <div class="ls-tab-content child1 ls-active">
                            <p>Contratos e Distribuídos</p>
                            <div id="panel-charts"></div>
                        </div>

                        <div class="ls-tab-content child2">

                            <table class="ls-table">
                                <thead>
                                    <tr>
                                        <th class="ls-txt-center">Período</th>
                                        <th class="ls-txt-center">Contratados</th>
                                        <th class="ls-txt-center hidden-xs" colspan="2">Distribuídos</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="ls-txt-center">28/03/2014 a 27/04/2014</td>
                                        <td class="ls-txt-center">1000000</td>
                                        <td class="ls-txt-center hidden-xs">10741</td>
                                        <td class="ls-txt-center hidden-xs">1%</td>
                                    </tr>
                                    <tr>
                                        <td class="ls-txt-center">28/03/2014 a 27/04/2014</td>
                                        <td class="ls-txt-center">1000000</td>
                                        <td class="ls-txt-center hidden-xs">10741</td>
                                        <td class="ls-txt-center hidden-xs">1%</td>
                                    </tr>
                                    <tr>
                                        <td class="ls-txt-center">28/03/2014 a 27/04/2014</td>
                                        <td class="ls-txt-center">1000000</td>
                                        <td class="ls-txt-center hidden-xs">10741</td>
                                        <td class="ls-txt-center hidden-xs">1%</td>
                                    </tr>
                                    <tr>
                                        <td class="ls-txt-center">28/03/2014 a 27/04/2014</td>
                                        <td class="ls-txt-center">1000000</td>
                                        <td class="ls-txt-center hidden-xs">10741</td>
                                        <td class="ls-txt-center hidden-xs">1%</td>
                                    </tr>
                                    <tr>
                                        <td class="ls-txt-center">28/03/2014 a 27/04/2014</td>
                                        <td class="ls-txt-center">1000000</td>
                                        <td class="ls-txt-center hidden-xs">10741</td>
                                        <td class="ls-txt-center hidden-xs">1%</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="tab2" class="ls-tab-content">

                        <div class="ls-tab-content child1 ls-active">
                            <p>Status do cliente</p>
                            <div id="panel-charts-client"></div>
                        </div>

                        <div class="ls-tab-content child2">
                            <table class="ls-table">
                                <thead>
                                    <tr>
                                        <th class="ls-txt-center">Data</th>
                                        <th class="ls-txt-center">Todos</th>
                                        <th class="ls-txt-center" colspan="2">Ativos</th>
                                        <th class="ls-txt-center hidden-xs" colspan="2">Desativados</th>
                                        <th class="ls-txt-center hidden-xs" colspan="2">Bloqueados por bounce</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="ls-txt-center">Hoje</td>
                                        <td class="ls-txt-center">29</td>
                                        <td class="ls-txt-center">26</td>
                                        <td class="ls-txt-center">89%</td>
                                        <td class="ls-txt-center hidden-xs">3</td>
                                        <td class="ls-txt-center hidden-xs">10%</td>
                                        <td class="ls-txt-center hidden-xs">0</td>
                                        <td class="ls-txt-center hidden-xs">0%</td>
                                    </tr>
                                    <tr>
                                        <td class="ls-txt-center">Hoje</td>
                                        <td class="ls-txt-center">29</td>
                                        <td class="ls-txt-center">26</td>
                                        <td class="ls-txt-center">89%</td>
                                        <td class="ls-txt-center hidden-xs">3</td>
                                        <td class="ls-txt-center hidden-xs">10%</td>
                                        <td class="ls-txt-center hidden-xs">0</td>
                                        <td class="ls-txt-center hidden-xs">0%</td>
                                    </tr>
                                    <tr>
                                        <td class="ls-txt-center">Hoje</td>
                                        <td class="ls-txt-center">29</td>
                                        <td class="ls-txt-center">26</td>
                                        <td class="ls-txt-center">89%</td>
                                        <td class="ls-txt-center hidden-xs">3</td>
                                        <td class="ls-txt-center hidden-xs">10%</td>
                                        <td class="ls-txt-center hidden-xs">0</td>
                                        <td class="ls-txt-center hidden-xs">0%</td>
                                    </tr>
                                    <tr>
                                        <td class="ls-txt-center">Hoje</td>
                                        <td class="ls-txt-center">29</td>
                                        <td class="ls-txt-center">26</td>
                                        <td class="ls-txt-center">89%</td>
                                        <td class="ls-txt-center hidden-xs">3</td>
                                        <td class="ls-txt-center hidden-xs">10%</td>
                                        <td class="ls-txt-center hidden-xs">0</td>
                                        <td class="ls-txt-center hidden-xs">0%</td>
                                    </tr>
                                    <tr>
                                        <td class="ls-txt-center">Hoje</td>
                                        <td class="ls-txt-center">29</td>
                                        <td class="ls-txt-center">26</td>
                                        <td class="ls-txt-center">89%</td>
                                        <td class="ls-txt-center hidden-xs">3</td>
                                        <td class="ls-txt-center hidden-xs">10%</td>
                                        <td class="ls-txt-center hidden-xs">0</td>
                                        <td class="ls-txt-center hidden-xs">0%</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
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

        <!--	<script src="http://opensource.locaweb.com.br/locawebstyle/assets/javascripts/libs/jquery-2.1.0.min.js" type="text/javascript">
                </script>
                <script src="http://opensource.locaweb.com.br/locawebstyle/assets/javascripts/example.js" type="text/javascript"></script>
                <script src="http://opensource.locaweb.com.br/locawebstyle/assets/javascripts/locastyle.js" type="text/javascript"></script>-->

        <script src="view/javascripts/highcharts.js" type="text/javascript"></script>
        <script src="view/javascripts/panel-charts.js" type="text/javascript"></script>

        <script src="http://code.highcharts.com/highcharts.js" type="text/javascript"></script>
        <script src="http://opensource.locaweb.com.br/locawebstyle/assets/javascripts/docs/panel-charts.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(window).on('load', function() {
                locastyle.browserUnsupportedBar.init();
            });
        </script>


    </body>
</html>

