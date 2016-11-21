/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tf_banco;

import java.io.IOException;
import java.sql.*;
import java.util.Scanner;
/**
 *
 * @author lucas
 */
public class TF_Banco {
    
    /**
     *
     * @return
     */
    public static boolean insereProduto(){
        int cod;
        double preco;
        String nome, descricao,categoria;
        Scanner scanner = new Scanner(System.in);
        System.out.println("Informe o codigo do produto"); 
        cod = scanner.nextInt();
        System.out.println("Informe o preço do produto"); 
        preco = scanner.nextDouble();
        return true;
    }
    
    public static boolean insereCliente(){
        Scanner scanner = new Scanner(System.in);  
        return true;
    }
    
    public static boolean inserePedido(){
        Scanner scanner = new Scanner(System.in);  
        return true;
    }
    
    public static void main(String[] args) throws SQLException, IOException {
        
        Scanner scanner = new Scanner(System.in);  
       
       /* try (Connection conexao = DriverManager.getConnection(
                "jdbc:oracle:thin:@//camburi.pucrs.br:1521/facin11g",
                "bf111287","bf111287")) {
            System.out.println("Conectado.");
            conexao.close();
        }catch(Exception e){
            System.out.println("Falha na conexão.");
        }*/
       int valida=0;
       while(valida!=4){
           System.out.println("Escolha uma opção:\n 1-Cadastro Produtos \n 2-Cadastro Clientes \n 3-Cadastro pedidos \n 4-Sair \n Informe a opção:"); 
           valida = scanner.nextInt();
           
           switch(valida){
               case 1:
                   System.out.println("Cadastro de Produtos!"); 
                   if(insereProduto()){
                       System.out.println("Produto cadastrado com sucesso");
                   }else{
                       System.out.println("Erro ao cadastrar produto");
                   }
                   break;
               case 2:
                   System.out.println("Cadastro de Clientes!"); 
                   if(insereCliente()){
                       System.out.println("Cliente cadastrado com sucesso");
                   }else{
                       System.out.println("Erro ao cadastrar cliente");
                   }
                   break;
               case 3:
                   System.out.println("Cadastro de Pedidos!"); 
                   if(inserePedido()){
                       System.out.println("Pedido cadastrado com sucesso");
                   }else{
                       System.out.println("Erro ao cadastrar pedido");
                   }
                   break;
               default:
                 System.out.println("Obrigado! volte sempre!");  
           }
       }
    }
    
}
