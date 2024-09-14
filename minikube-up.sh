#Certifique-se de que o Minikube está rodando.
status=$(minikube status --format='{{.Host}}' 2>&1)

if [[ "$status" != "Running" ]]; then
    echo "Minikube nao iniciado, iniciando..."
    minikube start
fi

#habilitar o ingress
minikube addons enable ingress

# Aplique os arquivos YAML ao cluster Kubernetes.
 kubectl apply -f database-deployment.yaml
 kubectl apply -f database-service.yaml	
 kubectl apply -f backend-deployment.yaml
 kubectl apply -f backend-service.yaml
 kubectl apply -f frontend-deployment.yaml
 kubectl apply -f frontend-service.yaml
 kubectl apply -f phpmyadmin-deployment.yaml
 kubectl apply -f phpmyadmin-service.yaml

apply_ingress(){
    kubectl apply -f cluster/ingress.yaml 2>&1
}

echo "Applying ingress.yaml..."
while true; do
    OUTPUT=$(apply_ingress)
    if [ $? -eq 0 ]; then    
        echo "$OUTPUT"
        break
    else
        echo "aguardando o ingress..."
        sleep 5
    fi
done


#Verifique se tudo está funcionando corretamente.
echo
echo "Pods created:"
kubectl get pods


echo
echo "Service available at http://k8s.local!"

#ao executar o script no windows, ele abre uma janela gitbash e a fecha rapidamente
#read -p $'\nNao some, Jesus te ama! Pressione enter para continuar...'