<%@page import="java.util.ArrayList"%>
<%@page import="bean.Usuario"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="ls-theme-blue">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuração E-mail de remetente</title>

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
                <h1 class="ls-title-intro ls-ico-cog">E-mail de remetente</h1>
                <p>Configure um domínio padrão para os links das mensagens e de acesso ao painel.</p>

                <div class="row">
                    <div class="col-md-12">
                        <div class="ls-box">
                            <h2 class="ls-title-2">E-mail atual</h2>
                            <hr>

                            <form action="#" class="ls-form" data-ls-module="form">
                                <div class="row ls-form-disable" id="email-form">
                                    <label class="ls-label col-md-5">
                                        <span class="ls-label-text ls-hidden-accessible">email</span>
                                        <input name="email" placeholder="email" required="" type="text" value="fulano@dominio.com">
                                        <p><small>Status do e-mail: Aprovado</small></p>
                                    </label>
                                </div>
                                <div id="email_actions" class="email-actions ls-display-none">
                                    <button type="submit" class="ls-btn-primary">Salvar</button>
                                    <button class="ls-btn" data-ls-fields-enable="#email-form" data-toggle-class="ls-display-none" data-target=".email-actions">Cancelar</button>
                                </div>
                                <button data-ls-fields-enable="#email-form" data-toggle-class="ls-display-none" data-target=".email-actions" class="ls-btn-primary email-actions">Editar</button>
                            </form>

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


        <aside class="ls-notification">
            <nav class="ls-notification-list" id="ls-notification-curtain">
                <h3 class="ls-title-2">Notificações</h3>
                <ul>
                    <li class="ls-dismissable">
                        <a href="#">Eveniet quia ipsam occaecati et</a>
                        <a href="#" data-ls-module="dismiss" class="ls-ico-close ls-close-notification"></a>
                    </li>
                    <li class="ls-dismissable">
                        <a href="#">Esse facilis et quia assumenda veritatis voluptatem</a>
                        <a href="#" data-ls-module="dismiss" class="ls-ico-close ls-close-notification"></a>
                    </li>
                    <li class="ls-dismissable">
                        <a href="#">Eos voluptatem sunt fugit atque qui dolorem voluptates necessitatibus laborum voluptatibus ut quas quo</a>
                        <a href="#" data-ls-module="dismiss" class="ls-ico-close ls-close-notification"></a>
                    </li>
                    <li class="ls-dismissable">
                        <a href="#">Vel quisquam adipisci quia officiis aperiam quisquam ullam et quisquam ab assumenda earum</a>
                        <a href="#" data-ls-module="dismiss" class="ls-ico-close ls-close-notification"></a>
                    </li>
                    <li class="ls-dismissable">
                        <a href="#">Est eius perferendis et et quia dolor laudantium autem dolorum ullam maxime voluptatem</a>
                        <a href="#" data-ls-module="dismiss" class="ls-ico-close ls-close-notification"></a>
                    </li>
                </ul>
                <p class="ls-no-notification-message">Não há notificações.</p>
            </nav>
            <nav class="ls-notification-list" id="ls-help-curtain">
                <h3 class="ls-title-2">Feedback</h3>
                <ul>
                    <li><a href="#">> quidem incidunt cupiditate aut fugiat vel</a></li>
                    <li><a href="#">> ea consequatur commodi optio maiores magnam</a></li>
                </ul>
            </nav>
            <nav class="ls-notification-list" id="ls-feedback-curtain">
                <h3 class="ls-title-2">Ajuda</h3>
                <ul>
                    <li class="ls-txt-center hidden-xs">
                        <a href="#" class="ls-btn-dark ls-btn-tour">Fazer um Tour</a>
                    </li>
                    <li><a href="#">> Guia</a></li>
                    <li><a href="#">> Wiki</a></li>
                </ul>
            </nav>
        </aside>




        <!-- We recommended use jQuery 1.10 or up -->
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="http://assets.locaweb.com.br/locastyle/3.10.1/javascripts/locastyle.js" type="text/javascript"></script>
    </body>
</html>

